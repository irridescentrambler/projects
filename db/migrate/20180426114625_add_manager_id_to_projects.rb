class AddManagerIdToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :manager_id, :integer
  end
end
