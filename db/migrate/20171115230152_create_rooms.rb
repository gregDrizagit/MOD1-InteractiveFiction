class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.text :description
      t.text :visited_description
      t.boolean :has_visited
    end
  end
end
