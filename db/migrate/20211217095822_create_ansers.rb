class CreateAnsers < ActiveRecord::Migration[6.1]
  def change
    create_table :ansers do |t|
      t.text :anser
      t.boolean :value

      t.timestamps
    end
  end
end
