class CreateRooms < ActiveRecord::Migration[5.1]
  def change

    create_table :rooms do |t|
      t.text :description
    end
  end
end
