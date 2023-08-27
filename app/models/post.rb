class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :group_posts
  has_many :groups, through: :group_posts
end
