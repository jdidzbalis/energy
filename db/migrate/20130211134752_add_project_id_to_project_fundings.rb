class AddProjectIdToProjectFundings < ActiveRecord::Migration
  def change
    add_column :project_fundings, :project_id, :integer
  end
end
