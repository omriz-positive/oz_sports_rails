class TraineesController < ApplicationController
  before_action :set_trainee, except: [:index,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: Trainee.all;
  end
  
  def show
    render json: @trainee;
  end
  
  def workouts
    @trainee_workouts = @trainee.workouts.all;
    render json: @trainee_workouts;
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
    @trainee.workout_trainees.destroy_all if @trainee.workout_trainees.any?
    @trainee.destroy
    trainee = @trainee.clone;
    render json: trainee;
  end

  private
    def set_trainee
      @trainee = Trainee.find(params[:id])
      raise ActiveRecord::RecordNotFound if @trainee.nil?
    end
    def trainee_params
      params.require(:trainee).permit(:name)
    end
    def record_not_found
      render plain: "Could not find resource for Trainer's Trainees", status: 404
    end
end
