class AddHasVisitedDescriptionColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :visited_description, :text
  end
end
