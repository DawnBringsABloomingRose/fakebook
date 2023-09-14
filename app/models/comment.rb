class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :notifications, as: :notificable

  after_create do |comment|
    Notification.new(user: comment.commentable.user, notificable: comment).save
  end
end
