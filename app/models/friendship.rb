class Friendship < ActiveRecord::Base
  attr_accessible :out_friend_id, :in_friend_id

  belongs_to :out_friend,
    class_name: "User",
    foreign_key: :out_friend_id,
    primary_key: :id


  belongs_to :in_friend,
    class_name: "User",
    foreign_key: :in_friend_id,
    primary_key: :id

  def self.can_friend?(user1, user2)
    exists = Friendship.exists?(out_friend_id: user1.id, in_friend_id: user2.id)
    puts exists
    return !exists
  end

end
