class Likable < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo_event
end
