class Message < ActiveRecord::Base
  belongs_to :from , class_name: "User"
  belongs_to :to , class_name: "User"

  def self.read_message(message,current_user)
    if current_user == message.to_id
      message.status = 1
      message.save
    end
  end
end
