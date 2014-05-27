class WorkoutPlansController < ApplicationController
  before_action :set_workout_plan, only: [:show, :edit, :update, :destroy, :add_exercise]

  layout 'admin'
  # GET /workout_plans
  # GET /workout_plans.json
  def index
    @workout_plans = WorkoutPlan.all
  end

  # GET /workout_plans/1
  # GET /workout_plans/1.json
  def show
    @workout_includings = WorkoutIncluding.where(workout_plan_id: @workout_plan.id).order('position')
  end

  # GET /workout_plans/new
  def new
    @workout_plan = WorkoutPlan.new
  end





  def add_exercise
    if(@workout_plan.part == 'All')
      @exercises = Exercise.all
    else
      @exercises = Exercise.where(part: @workout_plan.part)
    end
    @workout_including = WorkoutIncluding.where(workout_plan_id: @workout_plan.id)
  end

  # GET /workout_plans/1/edit
  def edit
    @workout_includings = WorkoutIncluding.where(workout_plan_id: @workout_plan.id)
  end

  # POST /workout_plans
  # POST /workout_plans.json
  def create
    @workout_plan = WorkoutPlan.new(workout_plan_params)

    respond_to do |format|
      if @workout_plan.save
        format.html { redirect_to add_exercise_workout_plan_path(@workout_plan.id), notice: 'Workout plan was successfully created.' }
        format.json { render action: 'add_exercise', status: :created, location: add_exercise_workout_plan_path(@workout_plan.id) }
      else
        format.html { render action: 'new' }
        format.json { render json: @workout_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workout_plans/1
  # PATCH/PUT /workout_plans/1.json
  def update
    respond_to do |format|
      if @workout_plan.update(workout_plan_params)
        format.html { redirect_to @workout_plan, notice: 'Workout plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @workout_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_plans/1
  # DELETE /workout_plans/1.json
  def destroy
    @workout_plan.destroy
    respond_to do |format|
      format.html { redirect_to workout_plans_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_workout_plan
    @workout_plan = WorkoutPlan.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def workout_plan_params
    params.require(:workout_plan).permit(:name,:difficulty,:part,:mode)
  end
end
