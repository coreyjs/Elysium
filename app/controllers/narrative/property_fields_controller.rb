# app/controllers/narrative/property_fields_controller.rb
class Narrative::PropertyFieldsController < ApplicationController
  before_action :set_dynamic_model, only: %i[ new create update]
  before_action :set_property_field, only: %i[ edit update destroy]

  def new
    @narrative_property_field = @dynamic_model.narrative_property_fields.build
    # @narrative_property_field.dynamic_model = @dynamic_model
  end

  def create
    @narrative_property_field = @dynamic_model.narrative_property_fields.create(property_field_params)
    if @narrative_property_field.save
      respond_to do |format|
        format.html { redirect_to redirect_dynamic_path(@dynamic_model), notice: 'Property field was successfully created.' }
        format.json { render :show, status: :created, location: @dynamic_model }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @dynamic_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    if @narrative_property_field.update(property_field_params)
      respond_to do |format|
        format.html { redirect_to redirect_dynamic_path(@dynamic_model), notice: 'Property field was successfully updated.' }
        format.json { render :show, status: :ok, location: @dynamic_model }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @dynamic_model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @narrative_property_field = @dynamic_model.narrative_property_fields.find(params[:id])
    @narrative_property_field.destroy
    respond_to do |format|
      format.html { redirect_to redirect_dynamic_path(@dynamic_model), notice: 'Property field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_dynamic_model
    @dynamic_model = if params[:narrative_root_id]
                      Narrative::Root.find(params[:narrative_root_id])
                    elsif params[:step_id]
                      Narrative::Step.find(params[:step_id])
                    end
  end

  def property_field_params
    params.require(:narrative_property_field).permit(:name, :value, :field_type, :narrative_root_id, :narrative_step_id)
  end

  def redirect_dynamic_path(model)
    case model
    when Narrative::Root
      project_narrative_series_narrative_root_path(model.project, model.narrative_series, model)
    when Narrative::Step
      # project_narrative_series_narrative_root_narrative_step_path(model.project, model.narrative_series, model.narrative_root, model)
    end
  end

  def set_property_field
    @narrative_property_field = Narrative::PropertyField.find(params[:id])
  end
end
