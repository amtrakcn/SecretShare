module FriendshipsHelper
  def can_friend?(user)
    (user != current_user) && Friendship.can_friend?(current_user, user)
  end

  def can_unfriend?(user)
    (user != current_user) && !Friendship.can_friend?(current_user, user)
  end

  def situation(user)
    return "can-friend" if can_friend?(user)
    return "can-unfriend" if can_unfriend?(user)
    return "self"
  end
end
