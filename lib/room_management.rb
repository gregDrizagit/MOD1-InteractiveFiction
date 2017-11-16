def room_description(room_id)
  room = Room.all.find(room_id)
  if room.has_visited == true
    puts room.visited_description
  else
    puts room.description
    room.visit
  end
end

def enter_room(user)
  user.increase_room_id
  if user.room_id == 3
    #check for items
    Item.all.items.each do |item|
      if item.user_id == user.id #if the user has the item
        #print the vistied room description
        Room.all.find(user.room_id).visited_description
      end
    end
      #room_description(user.room_id)


  elsif user.room_id == 5
    #check for items
      room_description(user.room_id)

  else
    room_description(user.room_id)
    list_items_in_room(user.room_id)
    puts "Would you like to pick up item? type pick up"
  end
end

def leave_room(user)
  user.decrease_room_id
  room_description(user.room_id)
  list_items_in_room(user.room_id)
end
