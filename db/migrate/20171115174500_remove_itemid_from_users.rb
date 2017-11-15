class RemoveItemidFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :item_id
  end
end
