class ChallengesController < ApplicationController
  layout 'admin'
  def index
    @friends = current_user.friends
    unless @friends.include? current_user
      @friends.push(current_user)
    end
    params[:sort] ||= 'total_cal'
    params[:direction] ||='desc'
    @friends = @friends.get_challenge_order_by(params[:sort],params[:direction])


  end
end
