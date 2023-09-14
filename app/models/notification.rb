class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notificable, polymorphic: true

  def see
    self.update(seen: true)
  end
end
