class RemoveDefaultDeckFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :default_deck, :boolean
  end
end
