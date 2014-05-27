class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :profile
  has_many :workouts
  has_many :taking_food_plans

  has_many :request_friendships
  has_many :request_tos, :through => :request_friendships

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friend ,:through => :friendships
  has_many :inbox_message , :class_name => 'Message' , :foreign_key => 'to_id'
  has_many :sent_message , :class_name => 'Message' , :foreign_key => 'from_id'

  def role?(role)
    case role
      when :admin
        r = 2
      when :coach
        r = 1
      when :normal
        r = 0
    end
    profile.role == r
  end


  def last_workout
    workouts.order('created_at').last
  end

  def self.get_challenge_order_by(sort,direction)
    self.select('users.profile_id, users.id, SUM( workouts.total_min ) as total_min , SUM( workouts.total_cal ) as total_cal').joins(:workouts).group('users.id').order("sum(workouts.#{sort}) #{direction}")
  end



end
