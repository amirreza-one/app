class RequestFriendshipsController < ApplicationController
  before_action :set_request_friendship, only: [:show, :edit, :update, :destroy]


  def create
    @request_friendship = current_user.request_friendships.build(:request_to_id => params[:request_to_id])

    respond_to do |format|
      if @request_friendship.save
        @profile = Profile.find(params[:profile_id])
        flash[:notice]= "#{t('other.request_sent',name:@profile.firstname)}";
        format.js

      else
        format.html { redirect_to profiles_add_friend_path, error: 'Unable to add friend.' }
      end
    end
  end


  # DELETE /request_friendships/1
  # DELETE /request_friendships/1.json
  def destroy
    @request_friendship = RequestFriendship.find(params[:id])
    @request_friendship.destroy
    @profile = Profile.find(params[:profile_id])
    respond_to do |format|
      format.html { redirect_to :back , notice: 'Deleted Friend.' }
      format.json { }
      @request_friendship = RequestFriendship.where('request_to_id = ?' , current_user.id)
      flash[:notice]= "#{t 'other.request_canceled'}";
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_friendship
      @request_friendship = RequestFriendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_friendship_params
      params.require(:request_friendship).permit(:user_id, :friend_id)
    end
end
