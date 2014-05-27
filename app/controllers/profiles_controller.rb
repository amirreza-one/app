class ProfilesController < ApplicationController
  require 'jalali_date'

  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  layout "admin"
  # GET /profiles
  # GET /profiles.json
  def index
    if(!params[:search_layout].blank?)
      @search_box = Profile.search(params[:search_layout],:page => params[:page], :per_page => 5 )
    else
      @search_box = Profile.where('1 = 0')
    end
    @profiles = Profile.search(params[:search],:page => params[:page], :per_page => 10)

  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    if params[:page].nil?
          @message = Message.new
          conditions = { user_id: current_user.id,
                         request_to_id: @profile.user.id }
          @request_friendship = RequestFriendship.find(:first , :conditions => conditions)
          conditions = { user_id: current_user.id,
              friend_id: @profile.user.id }
          @friendship = Friendship.find(:first , :conditions => conditions)
          @optionsProfile = []
          @optionsProfile.push( Workout.where(:user_id => @profile.user.id).sum(:total_min))
          @optionsProfile.push( Workout.where(:user_id => @profile.user.id).sum(:total_cal))

      end
      @photos = @profile.photo_events.order( 'created_at DESC' ).paginate(:page => params[:page], :per_page => 3)

    end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @aux_prof = AuxilaryProfile.new
    @photo_event = PhotoEvent.new
    respond_to do |format|
      if @profile.save
        @aux_prof.weight = @profile.weight
        @aux_prof.height = @profile.height
        @aux_prof.profile_id = @profile.id
        @aux_prof.save
        format.html { redirect_to @profile, notice: "#{t 'other.create_success'}"}
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
      current_user.profile = @profile
      current_user.save

    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update

    respond_to do |format|
      if @profile.update(profile_params)

        @aux_prof = AuxilaryProfile.new
        @aux_prof.weight = @profile.weight
        @aux_prof.height = @profile.height
        @aux_prof.profile_id = @profile.id
        @aux_prof.save

        format.html { redirect_to @profile, notice: "#{t 'other.update_success'}" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    @profile.user.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  def add_friend
    @profiles = Profile.search_friend(params[:search]).paginate(:page => params[:page], :per_page => 10)
    @friendships = current_user.friendships.paginate(:page => params[:friended_page], :per_page => 10)
  end

  def index_friend
    @friendships = current_user.friendships.paginate(:page => params[:page], :per_page => 5)
    @request_friendship = RequestFriendship.where('request_to_id = ?' , current_user.id)
    @count = current_user.friendships.count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :birthdate, :height, :weight, :country, :city, :role,:avatar,:cover ,:language,:gender)
    end
end
