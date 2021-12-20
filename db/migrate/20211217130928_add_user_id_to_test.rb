class AddUserIdToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :user_id, :integer
    add_index :tests, :user_id
    add_column :tests, :question_id, :has_many
  end
end
