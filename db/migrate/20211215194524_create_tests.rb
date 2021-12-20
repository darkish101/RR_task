class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description
     # t.integer :questions
      
      t.timestamps
    end
  end
end
