class AddCorrectAndIncoorectAnswerToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :correct_answer, :integer, default: 0
    add_column :cards, :incorrect_answer, :integer, default: 0
  end
end
