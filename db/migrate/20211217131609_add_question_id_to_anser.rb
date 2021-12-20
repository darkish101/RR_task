class AddQuestionIdToAnser < ActiveRecord::Migration[6.1]
  def change
    add_column :ansers, :question_id, :integer
    add_index :ansers, :question_id
  end
end
