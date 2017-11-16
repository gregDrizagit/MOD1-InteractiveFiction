require_relative '../config/environment.rb'

def greeting
puts "Welcome. What's your name?"
end

def room_description(room_id)
  room = Room.all.find(room_id)
  if room.has_visited
    room.visited_description
  else
    room.description
  end
end

def list_items_in_room(room_id)
  items = Room.all.find(room_id).items
  items.each do |item|
    puts "You found a #{item.name}."
  end
    puts "Type the item name(s) to pick up one item at a time."
    items
end

def get_items_in_room(room_id)
  Room.all.find(room_id).items
end


def item_transaction(user, input)
   Room.all.find(user.room_id).items.each do |item|
     if item.name == input
       user.items << item
     end
  end

  if get_items_in_room(user.room_id).length > 0
    puts "What other items would you like to pick up?"
    list_items_in_room(user.room_id)
    Room.all.find(user.room_id).items.delete(user.room_id)
else
    puts "There are no more items left in this room. What would you like to do? 1. Move Forward or 2. Turn Back"
  end
end



def input_listener(input)
  if input == "1" || input == "2"
    input
  elsif input == "exit"
    return "exit"
  else
    "Please enter valid input:
    1. Move Forward
    2. Move Backward"
  end
end


def make_user
  input = gets.chomp
  user = User.create(name: input, room_id: 1)
  user
end

def visit(user)
  user.room_id.has_visited = true
end

def enter_room(user)
  user.increase_room_id

  puts room_description(user.room_id)
  list_items_in_room(user.room_id)
  puts "Would you like to pick up item? type pick up"
end

def leave_room(user)
  user.decrease_room_id
  puts room_description(user.room_id)
  list_items_in_room(user.room_id)
end

def reset_game
  Room.all.each do |room|
    room.has_visited = false
  end
end

def run
  greeting
  user = make_user
  puts room_description(user.room_id)
  list_items_in_room(user.room_id)
  puts "What would you like to do? 1. Move Forward. 2. Leave, 3. Pick up"
  input = gets.chomp.downcase
  until input == "exit"
    case input
      # input = gets.chomp
    when "1"
        enter_room(user)
        input = gets.chomp
    when "2"
        leave_room(user)
        input = gets.chomp
    when "pick up"
      ## Must check valid input after prompting pick up item
      if get_items_in_room(user.room_id).length > 0
        list_items_in_room(user.room_id)
        input = gets.chomp
        item_transaction(user, input)
        input = gets.chomp
      else
        puts "There isn't anything left in this room. What else would you like to do?"
        input = gets.chomp
      end
    else
      puts "Please enter a valid command"
      input = gets.chomp
    end
  end
  reset_game
  delete_all_items
  create_all_items
end

def delete_all_items
  Item.delete_all
end

def create_all_items
  backpack = Item.create(name: "backpack")
  Room.all.first.items << backpack

  flashlight = Item.create(name: "flashlight")
  Room.all.second.items << flashlight

  candy_bar = Item.create(name: "candy bar")
  Room.all.last.items << candy_bar

  sword = Item.create(name: "sword")
  Room.all.first.items << sword

  rock = Item.create(name: "rock")
  Room.all.second.items << rock

  bottle = Item.create(name: "bottle")
  Room.all.last.items << bottle

end
run
