def make_user
  input = gets.chomp
  user = User.create(name: input, room_id: 1)
  user
end
