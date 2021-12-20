class AddAllAssociationToStudentTest < ActiveRecord::Migration[6.1]
  def change
    add_column :student_tests, :user_id, :integer
    add_index :student_tests, :user_id
    add_column :student_tests, :test_id, :integer
    add_index :student_tests, :test_id
    add_column :student_tests, :question_id, :integer
    add_index :student_tests, :question_id
    add_column :student_tests, :anser_id, :integer
    add_index :student_tests, :anser_id
  end
end
