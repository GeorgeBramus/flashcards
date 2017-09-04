class ChangeNameFieldSecond < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.rename :original, :translated_text
      t.rename :translated, :original_text
    end
  end
end
