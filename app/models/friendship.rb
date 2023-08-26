class Friendship < ApplicationRecord
  belongs_to :friendee, class_name: "User"
  belongs_to :friendor, class_name: "User"
end
