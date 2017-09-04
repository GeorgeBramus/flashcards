class ChangeNameFieldFirst < ActiveRecord::Migration[5.1]
  def change
    change_table :cards do |t|
      t.rename :original_text, :original
      t.rename :translated_text, :translated
    end
  end
end
