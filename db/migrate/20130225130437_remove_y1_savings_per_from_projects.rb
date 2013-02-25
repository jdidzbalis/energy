class RemoveY1SavingsPerFromProjects < ActiveRecord::Migration
  def up
  	remove_column :projects, :y1_savings_per
  end

  def down
  end
end
