class WorkoutsController < ApplicationController
  before_action :set_workout, only: [ :edit, :update, :destroy]

  layout "admin"


  def finish_workout

    @workout = Workout.find(params[:a_id])
    @workout.total_min = params[:a_time].to_i
    @workout.total_cal = Workout.calculateCalory(params[:a_level],params[:heart],params[:a_time],current_user.profile.id)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to current_user.profile, notice: "#{t('other.burn_cal_in_sec',total_cal: @workout.total_cal,total_min: params[:a_time])}" }

      else
        format.html { render action: 'edit' }
      end
    end
  end

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = current_user.workouts
    @workout_by_date = @workouts.group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
    @exercises = Workout.find(params[:id]).workout_plan.workout_includings.order('position')
  end

  # GET /workouts/new
  def new
    @plans = WorkoutPlan.all.paginate(:page => params[:page], :per_page => 20)
  end


  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new
    @workout.user_id = current_user.id
    @workout.date = Time.now
    @workout.workout_plan_id = params[:plan_id]
    @workout.total_min = 0
    @workout.total_cal = 0
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { render action: 'new' }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json



  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit( :workout_plan_id, :total_min, :total_cal)
    end
end
