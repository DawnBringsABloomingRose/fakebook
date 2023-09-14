class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :reciever, class_name: "User"

  has_one :notification, as: :notificable, dependent: :destroy

  after_create do |frequest|
    Notification.new(user: frequest.reciever, notificable: frequest).save
  end
end
