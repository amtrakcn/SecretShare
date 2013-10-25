module FriendshipsHelper
  def can_friend?(user)
    user != current_user && Friendship.can_friend?(current_user, user)
  end
end
