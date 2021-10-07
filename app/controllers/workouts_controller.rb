class WorkoutsController < ApplicationController
  before_action :get_trainer_workouts, :set_workout;
  skip_before_action :set_workout, only: [:index, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: @trainer_workouts.all;
  end

  def show
    render json: @workout
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.trainer_id = params[:trainer_id];
    if @workout.save
      render json: @workout, status: :created;
    else
      render json: @workout.errors, status: :unprocessable_entity;
    end
  end

  def update
    if @workout.update(workout_params)
      render json: @workout;
    else
      render json: @workout.errors, status: :unprocessable_entity;
    end
  end

  def destroy
    @workout.destroy
    workout = @workout.clone;
    render json: workout;
  end
  private
    def get_trainer_workouts
      @trainer_workouts = Workout.where(:trainer_id => params[:trainer_id]);
    end
    def set_workout
      @workout = @trainer_workouts.find(params[:id]);
    end
    def record_not_found
      render plain: "Could not find resource for Trainer's workout", status: 404
    end
    def workout_params
      params.require(:workout).permit(:name, :start_hour, :duration)
    end
end
