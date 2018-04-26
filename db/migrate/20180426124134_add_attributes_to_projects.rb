class AddAttributesToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :name, :string
    add_column :projects, :description, :text
  end
end
