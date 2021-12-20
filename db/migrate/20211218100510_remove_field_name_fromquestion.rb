class RemoveFieldNameFromquestion < ActiveRecord::Migration[6.1]
  def change
        remove_column :questions, :anser_id, :integer

  end
end
