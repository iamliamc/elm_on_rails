class AddItemsToMenu < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :menu, foreign_key: true
  end
end
