def list_items_in_room(room_id)
  items = Room.all.find(room_id).items
  items.each do |item|
    puts "#{item.name}"
  end
    puts text = <<-text

What would you like to do? Type 1 to Move Forward, 2 to Move Back, 3 to Pick Up an item

    text
end

def get_items_in_room(room_id)
  Room.all.find(room_id).items
end


def item_transaction(user, input)
  users_current_room = Room.all.find(user.room_id)

  if get_items_in_room(user.room_id).length > 0
    users_current_room.items.each do |item|
      if item.name == input
         user.items << item
         users_current_room.items.delete(item)
         puts "You picked up the #{item.name}"
         puts text = <<-text

     What would you like to do? Type 1 to Move Forward, 2 to Move Back, 3 to Pick Up an item

         text
      end
    end
    # list_items_in_room(user.room_id)
    # puts "What other items would you like to pick up?"
  else
    puts "There are no more items left in this room. What would you like to do? 1. Move Forward or 2. Turn Back"
  end
end
