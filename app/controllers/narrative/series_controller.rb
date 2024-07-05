class Narrative::SeriesController < ApplicationController
  before_action :set_narrative_series, only: %i[ show edit update destroy ]

  # GET /narrative/series or /narrative/series.json
  def index
    @narrative_series = Narrative::Series.all
  end

  # GET /narrative/series/1 or /narrative/series/1.json
  def show
  end

  # GET /narrative/series/new
  def new
    @narrative_series = Narrative::Series.new
  end

  # GET /narrative/series/1/edit
  def edit
  end

  # POST /narrative/series or /narrative/series.json
  def create
    @project = Project.find(params[:project_id])
    @narrative_series = @project.narrative_series.create(narrative_series_params)

    if @narrative_series.save
      render json: @narrative_series, status: :created
    else
      render json: @narrative_series.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /narrative/series/1 or /narrative/series/1.json
  def update
    respond_to do |format|
      if @narrative_series.update(narrative_series_params)
        format.html { redirect_to project_narrative_series_url(@narrative_series), notice: "Series was successfully updated." }
        format.json { render :show, status: :ok, location: @narrative_series }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @narrative_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrative/series/1 or /narrative/series/1.json
  def destroy
    @narrative_series.destroy!

    respond_to do |format|
      format.html { redirect_to narrative_series_index_url, notice: "Series was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_narrative_series
    @narrative_series = Narrative::Series.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def narrative_series_params
    params.require(:narrative_series).permit(:title, :description, :export_name)
  end

end
