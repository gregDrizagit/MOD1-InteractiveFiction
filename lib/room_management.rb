
def leave_room_description(user)
  room = Room.all.find(user.room_id)
  puts room.visited_description
end

def enter_room_description(user)
  room = Room.all.find(user.room_id)
  if user.room_id == 3
    flashlight = Item.all.find_by(name: "flashlight")
    if flashlight.user_id == user.id #if the user has the item
      puts room.visited_description
    else
      puts room.description
      leave_room(user)
    end
      #room_description(user.room_id)
  elsif user.room_id == 5

    #check for items
    #  room_description(user.room_id)
  elsif room.has_visited == true
    puts room.visited_description
    list_items_in_room(user.room_id)
  else room.has_visited == false
    puts room.description
    room.visit
  end
end

def enter_room(user)
  new_id = user.increase_room_id
  #if new_id == 3
  #   flashlight = Item.all.find_by(name: "flashlight")
  #   if flashlight.user_id == user.id #if the user has the item
  #         #print the vistied room description
  #       puts Room.all.find(user.room_id).visited_description
  #   else
  #     #room_description(user.room_id)
  #     puts Room.all.find(user.room_id).description
  #   end
  #     #room_description(user.room_id)
  # elsif new_id == 5
  #
  #   #check for items
  #   #  room_description(user.room_id)

  #  else
    enter_room_description(user)
    #list_items_in_room(user.room_id)
    puts "Would you like to pick up item? type pick up"
  # end
end

def leave_room(user)
  user.decrease_room_id
  leave_room_description(user)
  list_items_in_room(user.room_id)
#  puts Room.all.find(user.room_id).visited_description
  #end
end
