class FriendshipsController < ApplicationController
  def create
    return if User.find(friendship_params[:friendee_id]).friends.exists?(friendship_params[:friendor_id])
    return if friendship_params[:friendee_id] == friendship_params[:friendor_id]
    @friendship = Friendship.new(friendship_params)
    if @friendship.save 
      FriendRequest.find(params[:friend_request_id]).destroy
    end
  end

  def index
  end

  def destroy
    @friendrequest = FriendRequest.find(params[:id])
    @friendrequest.destroy
  end

  def friendship_params
    params.require(:friendship).permit(:friendee_id, :friendor_id)
  end
end
