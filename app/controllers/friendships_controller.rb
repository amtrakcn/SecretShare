class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(:out_friend_id => current_user.id, :in_friend_id => params[:user_id])

    if @friendship.save
      head :ok
    else
      render :json => @friendship.errors.full_messages
    end
  end

  def destroy
    # @user = User.find(params[:user_id])
    friendship = Friendship.find_by_in_friend_id_and_out_friend_id(params[:user_id], current_user.id)

    if friendship.destroy
      head :ok
    else
      render :json => friendship.errors.full_messages
    end
  end
end
