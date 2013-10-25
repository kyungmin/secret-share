class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new()
    @friendship.in_friend_id = current_user.id
    @friendship.out_friend_id = params[:user_id]
    @friendship.save!
    render :json => @friendship
  end

  def destroy
    @friendship = Friendship.find_by_in_friend_id_and_out_friend_id(current_user.id, params[:user_id])
    @friendship.destroy
    head :ok
  end
end
