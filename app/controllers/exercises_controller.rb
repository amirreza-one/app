class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  layout "admin"
  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.all.order(:part).order(:level).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show

  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
    @equipments = Equipment.order('name ASC')
  end

  # GET /exercises/1/edit
  def edit
    @equipments = Equipment.order('name ASC')
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: "#{t 'other.create_success'}" }
        format.json { render action: 'show', status: :created, location: @exercise }
      else
        @equipments = Equipment.order('name ASC')
        format.html { render action: 'new' }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "#{t 'other.update_success'}" }
        format.json { head :no_content }
      else
        @equipments = Equipment.order('name ASC')
        format.html { render action: 'edit' }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end


  def add_exercise
    @exercises = Exercise.search(params[:search])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def exercise_params
    params.require(:exercise).permit(:name, :part, :description, :description_fa, :level, :equipment_id, :days_per_week , :video, :avatar,:equipment_name)
  end
end
