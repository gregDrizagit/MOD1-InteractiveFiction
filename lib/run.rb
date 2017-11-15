require_relative '../config/environment.rb'

def greeting
  puts "welcome"
end

def room_description(id)
  Room.all[id].description
end

def input_listener
  input = gets.chomp
  # if input == "1" || input == "2"
  #   input
  # elsif input == "exit"
  #   return "exit"
  # else
  #   "Please enter valid input:
  #   1. Move Forward
  #   2. Move Backward"
  # end
end


def make_user
  input = gets.chomp
  user = User.create(name: input, room_id: 0)
  user
end

def run
  greeting
  puts "Welcome. What's your name?"
  user = make_user
  puts room_description(user.room_id)
  puts "What would you like to do? 1. Move Forward. 2. Leave"
  input = gets.chomp
  until input == "exit" do
    # input = gets.chomp
    if input == "1"
      user.increase_room_id
      puts room_description(user.room_id)
      puts "Would you like to pick up item? Y = yes, N = no"
      input = gets.chomp
    elsif input == "2"
      user.decrease_room_id
      puts room_description(user.room_id)
    elsif input.downcase == "y"
      Room.all.each do |room|
        if room.id == user.room_id
          user.items << room.items.first
        end
      end
      input = gets.chomp
    end
  end
end


run
