class AddDeveloperIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :developer_id, :integer
  end
end
