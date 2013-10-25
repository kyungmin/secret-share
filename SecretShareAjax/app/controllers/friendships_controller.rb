class FriendshipsController < ApplicationController
  def create
    sleep(2)

    @friendship = Friendship.new()
    @friendship.in_friend_id = current_user.id
    @friendship.out_friend_id = params[:user_id]
    @friendship.save!
    render :json => @friendship
  end
end
