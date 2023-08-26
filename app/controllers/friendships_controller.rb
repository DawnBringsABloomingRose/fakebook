class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.save
  end

  def friendship_params
    params.require(:friendship).permit(:friendee_id, :friendor_id)
  end
end
