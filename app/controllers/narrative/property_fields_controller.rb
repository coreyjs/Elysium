class Narrative::PropertyFieldsController < ApplicationController
  before_action :set_narrative_property_field, only: %i[ show edit update destroy ]

  # GET /narrative/property_fields or /narrative/property_fields.json
  def index
    @narrative_property_fields = Narrative::PropertyField.all
  end

  # GET /narrative/property_fields/1 or /narrative/property_fields/1.json
  def show
  end

  # GET /narrative/property_fields/new
  def new
    @narrative_property_field = Narrative::PropertyField.new
  end

  # GET /narrative/property_fields/1/edit
  def edit
  end

  # POST /narrative/property_fields or /narrative/property_fields.json
  def create
    @narrative_property_field = Narrative::PropertyField.new(narrative_property_field_params)

    respond_to do |format|
      if @narrative_property_field.save
        format.html { redirect_to narrative_property_field_url(@narrative_property_field), notice: "Property field was successfully created." }
        format.json { render :show, status: :created, location: @narrative_property_field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @narrative_property_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narrative/property_fields/1 or /narrative/property_fields/1.json
  def update
    respond_to do |format|
      if @narrative_property_field.update(narrative_property_field_params)
        format.html { redirect_to narrative_property_field_url(@narrative_property_field), notice: "Property field was successfully updated." }
        format.json { render :show, status: :ok, location: @narrative_property_field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @narrative_property_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrative/property_fields/1 or /narrative/property_fields/1.json
  def destroy
    @narrative_property_field.destroy!

    respond_to do |format|
      format.html { redirect_to narrative_property_fields_url, notice: "Property field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_narrative_property_field
      @narrative_property_field = Narrative::PropertyField.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def narrative_property_field_params
      params.fetch(:narrative_property_field, {})
    end
end
