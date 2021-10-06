class TraineeController < ApplicationController
    before_action :get_trainer_trainee
    before_action :set_trainee, only: %i[ show edit update destroy ]

  def index
    @trainees = @trainer_trainees.all
  end
  
  def show
  end

  def new
    @trainee = Trainee.new
  end

  def edit
  end

  def create
    @trainee = Trainee.new(trainee_params)

    respond_to do |format|
      if @trainee.save
        format.html { redirect_to @trainee, notice: "Trainer was successfully created." }
        format.json { render :show, status: :created, location: @trainee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trainee.update(trainee_params)
        format.html { redirect_to @trainee, notice: "Trainee was successfully updated." }
        format.json { render :show, status: :ok, location: @trainee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trainee.destroy
    respond_to do |format|
      format.html { redirect_to trainees_url, notice: "Trainee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_trainer_trainee
        trainer = Trainer.find(params[:trainer_id]);
        unless trainer.nil?
            @trainer_trainees = trainer.trainees 
        else
            render status: 404
        end
    end
    def set_trainee
      @trainee = @trainer_trainees.find(params[:id])
    end

    def trainee_params
      params.require(:trainee).permit(:name, :trainer_id)
    end
end
