class TraineesController < ApplicationController
  before_action :set_trainee, except: [:index,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @trainees = Trainee.where(trainer_id: params[:trainer_id]).includes(:workouts);
    # Couldn't do it with the select option.....
    trainees = @trainees.to_a.map do |t| 
      hash = t.as_json;
      hash["last_workout"] = t.workouts.last;
      t = hash;
    end
    render json: trainees;
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
    @trainee.workout_trainees.destroy_all if @trainee.workout_trainees.any?
    @trainee.destroy
    trainee = @trainee.clone;
    render json: trainee;
  end

  private
    def set_trainee
      @trainee = Trainee.find(params[:id])
    end
    def trainee_params
      params.require(:trainee).permit(:name)
    end
    def record_not_found
      render plain: "Could not find resource for Trainer's Trainee/s", status: 404
    end
end
