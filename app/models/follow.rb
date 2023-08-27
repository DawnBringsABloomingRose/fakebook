class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, polymorphic: true
end
