class LikablesController < ApplicationController
  before_action :set_likable, only: [:show, :edit, :update, :destroy]

  # GET /likables
  # GET /likables.json
  def index
    @likables = Likable.all
  end

  # GET /likables/1
  # GET /likables/1.json
  def show
  end

  # GET /likables/new
  def new
    @likable = Likable.new
  end

  # GET /likables/1/edit
  def edit
  end

  # POST /likables
  # POST /likables.json
  def create
    @likable = Likable.new(likable_params)

    respond_to do |format|
      if @likable.save
        format.html { redirect_to @likable, notice: 'Likable was successfully created.' }
        format.json { render action: 'show', status: :created, location: @likable }
      else
        format.html { render action: 'new' }
        format.json { render json: @likable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likables/1
  # PATCH/PUT /likables/1.json
  def update
    respond_to do |format|
      if @likable.update(likable_params)
        format.html { redirect_to @likable, notice: 'Likable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @likable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likables/1
  # DELETE /likables/1.json
  def destroy
    @likable.destroy
    respond_to do |format|
      format.html { redirect_to likables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_likable
      @likable = Likable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def likable_params
      params.require(:likable).permit(:user_id, :photo_event_id)
    end
end
