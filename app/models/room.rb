class Room < ActiveRecord::Base
  has_many :items

  def visit
    #oom.all.find(user_id).has_visited = true
    Room.update(self.id, :has_visited => true)
  end

  def self.reset_room
    Room.all.each do |room|
      Room.update(room.id, :has_visited => false)
    end
  end

end
