class AmountType < ActiveRecord::Base
  has_many :foods
  validates_presence_of :name
end
