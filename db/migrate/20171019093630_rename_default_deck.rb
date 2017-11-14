class RenameDefaultDeck < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.rename :default_deck, :default_deck_id
    end
  end
end
