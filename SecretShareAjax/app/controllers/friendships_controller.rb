class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new()
    @friendship.in_friend_id = current_user.id
    @friendship.out_friend_id = params[:user_id]
    @friendship.save!
    redirect_to users_url
  end
end
