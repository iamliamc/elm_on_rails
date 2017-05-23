class RenameMenuItem < ActiveRecord::Migration[5.1]
  def change
    rename_table :menu_items, :items
  end
end
