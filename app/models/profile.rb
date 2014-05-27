class Profile < ActiveRecord::Base
  has_one :user
  has_many :auxilary_profiles
  has_many :photo_events
  
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" , :small => "30X30#" }, :default_url => "/images/:style/profile.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_attached_file :cover, :styles => { :medium => "1100x472#", :thumb => "100x100#" }, :default_url => "/images/:style/cover.jpg"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :firstname , :lastname , :birthdate , :height , :weight , :country , :city
  validates_numericality_of :height





  def self.search_friend(search)
      where( 'firstname LIKE ? OR lastname LIKE ? ', "%#{search}%","%#{search}%")

  end



end
