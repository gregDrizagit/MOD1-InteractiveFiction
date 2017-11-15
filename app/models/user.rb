class User < ActiveRecord::Base
  belongs_to :room
  has_many :items
  def increase_room_id
    new_id = self.room_id += 1
    User.update(self.id, :room_id => new_id)
  end

  def decrease_room_id
    new_id = self.room_id -= 1
    User.update(self.id, :room_id => new_id)
  end

end
