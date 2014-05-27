class ChartsController < ApplicationController
  layout 'admin'
  def index
    @data = current_user.profile.auxilary_profiles
  end
end
