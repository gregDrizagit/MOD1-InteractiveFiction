class AddHasVisitedColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :has_visited, :boolean
  end
end
