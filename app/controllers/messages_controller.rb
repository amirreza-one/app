class MessagesController < ApplicationController
  layout "admin"


  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  def inbox
    @messages = current_user.inbox_message.order('created_at DESC').paginate(:page => params[:page], :per_page => 7)
    @inbox = @messages.where('status = 0').count
  end
  def sent
    @messages = current_user.sent_message.order('created_at DESC').paginate(:page => params[:page], :per_page => 7)
    @inbox = current_user.inbox_message.where('status = 0').count
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    @inbox = current_user.inbox_message.where('status = 0').count
    Message.read_message(@message,current_user.id)
  end



  # GET /messages/new
  def new
    @message = Message.new
    @to_param = params[:to]
  end


  # POST /messages
  # POST /messages.json
  def create

    @message = Message.new(message_params)
    @message.from = current_user
    @message.status = 0
    respond_to do |format|
      if @message.save
        format.html { redirect_to profile_path(@message.to.profile_id), notice: 'Message Sent.' }
        flash[:notice]= "#{t 'other.message_sent'}";
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])

    @message.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.


  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:to_id, :content , :page)
  end
end
