class FriendRequestsController < ApplicationController
  def create
    return if FriendRequest.exists?(reciever_id: params[:friend_request][:reciever_id], sender_id: current_user.id)
    return if params[:friend_request][:reciever_id].to_i == current_user.id
    return if FriendRequest.exists?(sender_id: params[:friend_request][:reciever_id], reciever_id: current_user.id)
    return if current_user.friends.exists?(params[:friend_request][:reciever_id])

    @friend_request = current_user.sent_requests.build(friend_request_params)

    if @friend_request.save
    else
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:reciever_id)
  end
end
