class RemoveUserIdFromProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :user_id
  	add_column :projects, :percent_funded, :integer
  	
  end

  def down
  end
end
