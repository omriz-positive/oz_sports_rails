class WorkoutsController < ApplicationController
  before_action :get_trainer_workouts, :set_workout;
  skip_before_action :set_workout, only: [:index, :create]
  
  def index
    render json: @trainer_workouts.all ,each_serializer: WorkoutsSerializer;
  end

  def show
    render json: @workout
  end

  def create
    if @workout = Workout.create(workout_params)
      render json: @workout, status: :created;
    else
      render json: @workout.errors, status: :unprocessable_entity;
    end
  end

  def update
    if @workout.update!(workout_params)
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
      @workout = Workout.find(params[:id]);
    end
    def workout_params
      params.require(:workout).permit(:name, :start_hour, :duration, :trainer_id,
         :workout_trainees_attributes => [:id, :trainee_id, :_destroy]);
    end
end
