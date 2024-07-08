class DefaultPropertyFieldsController < ApplicationController
  before_action :set_default_property_field, only: %i[ show edit update destroy ]

  # GET /default_property_fields or /default_property_fields.json
  def index
    @default_property_fields = DefaultPropertyField.all
  end

  # GET /default_property_fields/1 or /default_property_fields/1.json
  def show
  end

  # GET /default_property_fields/new
  def new
    @default_property_field = DefaultPropertyField.new
  end

  # GET /default_property_fields/1/edit
  def edit
  end

  # POST /default_property_fields or /default_property_fields.json
  def create
    @default_property_field = DefaultPropertyField.new(default_property_field_params)

    respond_to do |format|
      if @default_property_field.save
        format.html { redirect_to default_property_field_url(@default_property_field), notice: "Default property field was successfully created." }
        format.json { render :show, status: :created, location: @default_property_field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @default_property_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /default_property_fields/1 or /default_property_fields/1.json
  def update
    respond_to do |format|
      if @default_property_field.update(default_property_field_params)
        format.html { redirect_to default_property_field_url(@default_property_field), notice: "Default property field was successfully updated." }
        format.json { render :show, status: :ok, location: @default_property_field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @default_property_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_property_fields/1 or /default_property_fields/1.json
  def destroy
    @default_property_field.destroy!

    respond_to do |format|
      format.html { redirect_to default_property_fields_url, notice: "Default property field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_default_property_field
      @default_property_field = DefaultPropertyField.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def default_property_field_params
      params.fetch(:default_property_field, {})
    end
end
