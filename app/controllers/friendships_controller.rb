class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(:out_friend_id => current_user.id, :in_friend_id => params[:user_id])
    # or:
    # friend = User.find(params[:user_id])
    # current_user.friends << friend

    if @friendship.save
      redirect_to users_url
    else
      flash[:errors] = @friendship.errors.full_messages
      redirect_to users_url
    end
  end
end
