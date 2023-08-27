class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_members
  has_many :members, through: :group_members
  has_many :group_posts
  has_many :posts, through: :group_posts
end
