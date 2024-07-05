class Narrative::RootsController < ApplicationController
  before_action :set_narrative_root, only: %i[ show edit update destroy ]

  # GET /narrative/roots or /narrative/roots.json
  def index
    @narrative_roots = Narrative::Root.all
  end

  # GET /narrative/roots/1 or /narrative/roots/1.json
  def show
  end

  # GET /narrative/roots/new
  def new
    @narrative_root = Narrative::Root.new
  end

  # GET /narrative/roots/1/edit
  def edit
  end

  # POST /narrative/roots or /narrative/roots.json
  def create
    @narrative_root = Narrative::Root.new(narrative_root_params)

    respond_to do |format|
      if @narrative_root.save
        format.html { redirect_to narrative_root_url(@narrative_root), notice: "Root was successfully created." }
        format.json { render :show, status: :created, location: @narrative_root }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @narrative_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /narrative/roots/1 or /narrative/roots/1.json
  def update
    respond_to do |format|
      if @narrative_root.update(narrative_root_params)
        format.html { redirect_to narrative_root_url(@narrative_root), notice: "Root was successfully updated." }
        format.json { render :show, status: :ok, location: @narrative_root }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @narrative_root.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narrative/roots/1 or /narrative/roots/1.json
  def destroy
    @narrative_root.destroy!

    respond_to do |format|
      format.html { redirect_to narrative_roots_url, notice: "Root was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_narrative_root
      @narrative_root = Narrative::Root.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def narrative_root_params
      params.fetch(:narrative_root, {})
    end
end
