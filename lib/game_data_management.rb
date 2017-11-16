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
  backpack = Item.create(name: "backpack")
  Room.all[0].items << backpack

  flashlight = Item.create(name: "flashlight")
  Room.all[0].items << flashlight

  candy_bar = Item.create(name: "candy bar")
  Room.all[1].items << candy_bar

  sword = Item.create(name: "sword")
  Room.all[1].items << sword

  rock = Item.create(name: "rock")
  Room.all[2].items << rock

  bottle = Item.create(name: "bottle")
  Room.all[2].items << bottle

  toothbrush = Item.create(name: "toothbrush")
  Room.all[3].items << toothbrush

  wallet = Item.create(name: "wallet")
  Room.all[3].items << wallet


  soda = Item.create(name: "soda")
  Room.all[4].items << soda

  walking_stick = Item.create(name: "walking_stick")
  Room.all[4].items << walking_stick

end
