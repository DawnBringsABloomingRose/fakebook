class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :like
  has_many :comments
  has_many :notifications
  has_many :owned_groups, foreign_key: "owner_id", class_name: "Group"
  has_many :group_members, foreign_key: "member_id"
  has_many :belonged_groups, through: :group_members, source: :group
  has_many :follows, as: :following
  has_many :following, foreign_key: "follower_id", class_name: "Follow"
  has_many :followed_users, through: :following, source: :following, source_type: "User"
  has_many :followed_groups, through: :following, source: :following, source_type: "Group"

  #friends
  has_many :sent_frequests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :received_frequests, foreign_key: "reciever_id", class_name: "FriendRequest"
  has_many :sent_requests, through: :sent_frequests, class_name: "User", source: "reciever"
  has_many :received_requests, through: :received_frequests, class_name: "User", source: "sender"
  
  def friends
    User.where(id: Friendship.select(
      "CASE WHEN friendor_id = #{self.id} THEN friendee_id 
            WHEN friendee_id = #{self.id} THEN friendor_id 
      END AS friend").where(friendee_id: self.id).or(Friendship.where(friendor_id: self.id)))
  end

  def main_feed
    #Post.where(user: self.friends).or(Post.where(public_status: true, user: self.followed_users)).or(
    #  Post.includes(:groups).where(groups: { id: self.group_members }).or(
    #    Post.includes(:groups).where(public_status: true, groups: { id: self.group_members })))
    # above implementation does not work with current version of rails
    # open issue with "or" method and any form of join or eager loading
    # keeping for potential future use

    Post.left_joins(:groups).where("(posts.user_id = ?) OR (posts.public_status = ? AND posts.user_id = ?)
                                  OR (groups.id = ?) OR (posts.public_status = ? AND groups.id = ?)",
                                  self.friends.ids, true, self.followed_users.ids, self.group_members.ids, true, self.followed_groups.ids)
                                  .order(:created_at).reverse_order.limit(10)
  end
  
end
