class Exercise < ActiveRecord::Base
  belongs_to :equipment
  has_many :workout_includings
  has_many :workout_plans, :through => :workout_includings

  mount_uploader :video, VideoUploader
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "100x100#" }, :default_url => "/images/:style/exer.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def equipment_name
    equipment.try(:name)
  end
  def equipment_name=(name)
    self.equipment = Equipment.find_or_create_by_name(name)
  end

end
