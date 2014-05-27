class PhotoEvent < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :photo, :styles => { :medium => "200x300#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
