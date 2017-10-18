class RemoveDefaultFromDecks < ActiveRecord::Migration[5.1]
  def change
    remove_column :decks, :default, :boolean
  end
end
