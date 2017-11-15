class CreateRooms < ActiveRecord::Migration[5.1]
  def change

    create_table :rooms do |t|
      t.text :description
      t.integer :item_id
    end
  end
end
