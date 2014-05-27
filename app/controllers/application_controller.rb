class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_user_language
  before_action :set_inbox

  def search_friend
      @profiles = Profile.search_friend(params[:search])

    respond_to do |format|
      format.json { render 'layouts/search_friend' }
    end
  end

  def after_sign_in_path_for(resource)
    unless resource.profile_id
      "/profiles/new"
    else
      "/profiles/#{resource.profile_id}"
    end
  end





  private
  def set_inbox
    unless(current_user.nil?)
      @inbox = current_user.inbox_message.where('status = 0').count
      @request_count = RequestFriendship.where('request_to_id = ?' , current_user.id).count
    end
  end

  def set_user_language
    I18n.locale = current_user.profile.language if user_signed_in? && !current_user.profile.nil?
  end

end
