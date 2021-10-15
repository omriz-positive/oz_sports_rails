class TraineesController < ApplicationController
  before_action :set_trainee, except: [:index,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    render json: Trainee.where(:trainer_id => params[:trainer_id]);
  end
  
  def show
    render json: @trainee;
  end

  def create
    @trainee = Trainee.new(trainee_params)
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
    def set_trainee
      @trainee = Trainee.find(params[:id])
    end
    def trainee_params
      params.require(:trainee).permit(:name, :trainer_id)
    end
    def record_not_found
      render plain: "Could not find resource for Trainer's Trainee/s", status: 404
    end
end
