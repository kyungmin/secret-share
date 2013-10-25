class Friendship < ActiveRecord::Base
  attr_accessible :out_friend_id, :in_friend_id

  validates :out_friend_id, :in_friend_id, :presence => true
  validates :out_friend_id, :uniqueness => { :scope => :in_friend_id }

  belongs_to :out_friend, :class_name => "User"
  belongs_to :in_friend, :class_name => "User"

  def self.can_friend?(out_friend_id, in_friend_id)
    return false if out_friend_id == in_friend_id
    !Friendship.exists?(:out_friend_id => out_friend_id, :in_friend_id => in_friend_id)
  end
end
