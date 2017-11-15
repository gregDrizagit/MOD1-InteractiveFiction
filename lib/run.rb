require_relative '../config/environment.rb'

def greeting
  puts "welcome"
end

def room_description(room_id)
  Room.all.find(room_id).description
end

def list_items_in_room(room_id)
  items = Room.all.find(room_id).items
  items.each do |item|
    puts "You found #{item.name}."
  end
end

def item_transaction(user, input)
   Room.all.find(user.room_id).items.each do |item|
     if item.name == input
       user.items << item
     end
  end
  #Room.all.find(user.room_id).items.delete(0)
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

def run
  greeting
  puts "Welcome. What's your name?"
  user = make_user
  puts room_description(user.room_id)
  list_items_in_room(user.room_id)
  puts "What would you like to do? 1. Move Forward. 2. Leave, 3. Pick up"
  input = gets.chomp
  until input == "exit" do
    # input = gets.chomp
    if input == "1"
      user.increase_room_id
      puts room_description(user.room_id)
      list_items_in_room(user.room_id)
      puts "Would you like to pick up item? Y = yes, N = no"
      input = gets.chomp
    elsif input == "2"
      user.decrease_room_id
      puts room_description(user.room_id)
      list_items_in_room(user.room_id)
      input = gets.chomp
    elsif input.downcase == "y"
      input = gets.chomp


      item_transaction(user, input)
      puts "YOU GOT IT!"
      #item_manager
      # Room.all.each do |room|
      #   if room.id == user.room_id
      #     user.items << room.items.first
      #   end
      # end
      input = gets.chomp
    end
  end
end


run
