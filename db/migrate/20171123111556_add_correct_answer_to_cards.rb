class AddCorrectAnswerToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :correct_answer, :integer
  end
end
