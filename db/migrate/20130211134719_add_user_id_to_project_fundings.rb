class AddUserIdToProjectFundings < ActiveRecord::Migration
  def change
    add_column :project_fundings, :user_id, :integer
  end
end
