class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :like
  has_many :comments
  has_many :owned_groups, foreign_key: "owner_id", class_name: "Group"
  has_many :group_members, foreign_key: "member_id"
  has_many :belonged_groups, through: :group_members, source: :group


  #friends
  has_many :sent_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :recieved_requests, foreign_key: "reciever_id", class_name: "FriendRequest"
  
  def friends
    User.where(id: Friendship.select(
      "CASE WHEN friendor_id = #{self.id} THEN friendee_id 
            WHEN friendee_id = #{self.id} THEN friendor_id 
      END AS friend").where(friendee_id: self.id).or(Friendship.where(friendor_id: self.id)))
  end

  
end
