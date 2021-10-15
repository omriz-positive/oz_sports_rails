class TrainersController < ApplicationController
  before_action :set_trainer, only: %i[ show update destroy ]

  def main
    render :file => 'public/vue/index.html'
  end

  def index
    render json: Trainer.all;
  end

  def show
    render json: @trainer;
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      render json: @trainer, status: 201;
    else
      render json: @trainer.errors, status: 400;
    end
  end

  def update
    if @trainer.update(trainer_params)
      render json: @trainer, status: 201;
    else
      render json: @trainer.errors, status: 400;
    end
  end

  def destroy
    @trainer.destroy
    render :json => @trainer
  end

  private
    def set_trainer
      @trainer = Trainer.find(params[:id])
    end

    def trainer_params
      params.require(:trainer).permit(:name)
    end
end
