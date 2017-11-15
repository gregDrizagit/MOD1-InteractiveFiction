class AddRoomidToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :room_id, :integer
  end
end
