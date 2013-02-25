class AddProjectOwnerToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_owner, :string
    add_column :projects, :project_location, :string
    add_column :projects, :project_opdate, :date
    add_column :projects, :project_esavings, :integer
    add_column :projects, :project_csavings, :integer
    add_column :projects, :project_allocation, :integer
  end
end
