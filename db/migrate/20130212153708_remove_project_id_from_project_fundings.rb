class RemoveProjectIdFromProjectFundings < ActiveRecord::Migration
  def up
    remove_column :project_fundings, :project_id
  end

  def down
    add_column :project_fundings, :project_id, :integer
  end
end
