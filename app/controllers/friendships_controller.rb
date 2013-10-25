class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(:out_friend_id => current_user.id, :in_friend_id => params[:user_id])

    if @friendship.save
      render :json => @friendship
    else
      render :json => @friendship.errors.full_messages
    end
  end
end
