class Narrative::StepsController < ApplicationController
  before_action :set_narrative_step, only: %i[ show edit update destroy ]

  def index
    @narrative_steps = Narrative::Step.all
  end

  def show
  end

  def new
    @narrative_step = Narrative::Step.new(narrative_root_id: params[:narrative_root_id])
  end

  # GET /narrative/steps/1/edit
  def edit
  end

  def create
    @narrative_step = Narrative::Step.new_with_defaults!(narrative_step_params)
    @narrative_step.narrative_root = Narrative::Root.find(params[:narrative_root_id])

    respond_to do |format|
      if @narrative_step.save
        format.html { redirect_to project_narrative_series_narrative_root_narrative_step_path(@narrative_step), notice: "Step was successfully created." }
        format.json { render :show, status: :created, location: @narrative_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @narrative_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narrative/steps/1 or /narrative/steps/1.json
  def update
    respond_to do |format|
      if @narrative_step.update(narrative_step_params)
        format.html { redirect_to narrative_step_url(@narrative_step), notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @narrative_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @narrative_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrative/steps/1 or /narrative/steps/1.json
  def destroy
    @narrative_step.destroy!

    respond_to do |format|
      format.html { redirect_to narrative_steps_url, notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_narrative_step
      @narrative_step = Narrative::Step.find(params[:id])
    end

    def narrative_step_params
      params.require(:narrative_step).permit(:title, :ordinal, :narrative_root_id)
    end
end
