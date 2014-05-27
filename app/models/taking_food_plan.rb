class TakingFoodPlan < ActiveRecord::Base
  belongs_to :profile
  belongs_to :plan

end
