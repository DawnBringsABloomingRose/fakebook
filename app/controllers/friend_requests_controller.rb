class FriendRequestsController < ApplicationController
  def create
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
