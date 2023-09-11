class LikesController < ApplicationController
  def create
    @like = current_user.like.build(likes_params)

    if @like.save
    else
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
  
  private

  def likes_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
