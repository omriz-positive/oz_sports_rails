class TrainersController < ApplicationController
  before_action :set_trainer, only: %i[ show edit update destroy ]

  # GET /trainers or /trainers.json
  def index
    render json: Trainer.all;
  end

  def main
    render :file => 'public/vue/index.html'
  end

  # GET /trainers/1 or /trainers/1.json
  def show
    render json: @trainer;
  end

  # POST /trainers or /trainers.json
  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      render json: @trainer, status: 201;
    else
      render json: @trainer.errors, status: 400;
    end
  end

  # PATCH/PUT /trainers/1 or /trainers/1.json
  def update
    if @trainer.update(trainer_params)
      render json: @trainer, status: 201;
    else
      render json: @trainer.errors, status: 400;
    end
  end

  # DELETE /trainers/1 or /trainers/1.json
  def destroy
    @trainer.destroy
    respond_to do |format|
      format.html { redirect_to trainers_url, notice: "Trainer was successfully destroyed." }
      format.json { render :json => @trainer }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trainer_params
      params.require(:trainer).permit(:name)
    end
end
