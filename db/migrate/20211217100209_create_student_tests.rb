class CreateStudentTests < ActiveRecord::Migration[6.1]
  def change
    create_table :student_tests do |t|
      t.boolean :student_anser

      t.timestamps
    end
  end
end
