class DefaultDeck < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :default_deck, :integer
  end
end
