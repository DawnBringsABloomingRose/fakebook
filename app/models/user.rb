class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :sent_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :recieved_requests, foreign_key: "reciever_id", class_name: "FriendRequest"
  has_many :posts
  has_many :likes
  #has_many :recieved_requests, through: :sent_requests, source: :reciever
end
