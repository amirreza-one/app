class Food < ActiveRecord::Base
  belongs_to :amount_type
  has_attached_file :avatar, :styles => { :medium => "200x200#", :thumb => "50x50#" }, :default_url => "/images/:style/Fruit.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    if search
      where( 'name LIKE ?  ', "%#{search}%")
    else
      scoped
    end
  end
end
