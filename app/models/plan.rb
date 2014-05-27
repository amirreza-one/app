class Plan < ActiveRecord::Base
  has_and_belongs_to_many :foods
  has_many :taking_food_plans
end
