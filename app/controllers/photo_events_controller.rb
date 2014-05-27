class PhotoEventsController < ApplicationController
  before_action :set_photo_event, only: [:show, :edit, :update, :destroy]
  # GET /photo_events
  # GET /photo_events.json
  def index
    @photo_events = PhotoEvent.all
  end

  # GET /photo_events/1
  # GET /photo_events/1.json
  def show
  end


  # POST /photo_events
  # POST /photo_events.json
  def create
    @photo_event = PhotoEvent.new(photo_event_params)

    respond_to do |format|
      if @photo_event.save
        format.html { redirect_to :back, notice: 'Photo event was successfully uploaded.' }
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  # DELETE /photo_events/1
  # DELETE /photo_events/1.json
  def destroy
    @photo_event.destroy
    respond_to do |format|
      format.html { redirect_to :back , notice: 'Photo event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_event
      @photo_event = PhotoEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_event_params
      params.require(:photo_event).permit(:summary, :profile_id,:photo)
    end
end
