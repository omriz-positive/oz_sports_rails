class TraineesController < ApplicationController
  before_action :get_trainer_trainee, :set_trainee
  skip_before_action :set_trainee, only: [:index, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @trainees = @trainer_trainees.all
    render json: @trainees;
  end
  
  def show
    render json: @trainee;
  end

  def create
    @trainee = Trainee.new(trainee_params)
    @trainee.trainer_id = params[:trainer_id];
    if @trainee.save
      render json: @trainee, status: :created;
    else
      render json: @trainee.errors, status: :unprocessable_entity;
    end
  end

  def update
    if @trainee.update(trainee_params)
      render json: @trainee;
    else
      render json: @trainee.errors, status: :unprocessable_entity;
    end
  end

  def destroy
    @trainee.destroy
    trainee = @trainee.clone;
    render json: trainee;
  end

  private
    def get_trainer_trainee
      @trainer_trainees = Trainee.where(:trainer_id => params[:trainer_id]);
    end
    def set_trainee
      @trainee = @trainer_trainees.find(params[:id])
      raise ActiveRecord::RecordNotFound if @trainee.nil?
    end
    def trainee_params
      params.require(:trainee).permit(:name)
    end
    def record_not_found
      render plain: "Could not find resource for Trainer's Trainees", status: 404
    end
end
