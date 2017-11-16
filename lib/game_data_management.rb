def reset_game
  # Room.all.each do |room|
  #   room.has_visited = false
  # end
  Room.reset_room
end
def delete_all_items
  Item.delete_all
end

def create_all_items
  first_aid = Item.create(name: "first aid kit")
  Room.all[0].items << first_aid

  flashlight = Item.create(name: "flashlight")
  Room.all[0].items << flashlight

  bat = Item.create(name: "bat with nails")
  Room.all[1].items << bat

  firearm = Item.create(name: "firearm")
  Room.all[1].items << firearm

  crowbar = Item.create(name: "crowbar")
  Room.all[3].items << crowbar

end
