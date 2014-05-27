class RequestFriendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :request_to, :class_name => "User"
end
