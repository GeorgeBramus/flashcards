class AddIncorrectAnswerToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :incorrect_answer, :integer
  end
end
