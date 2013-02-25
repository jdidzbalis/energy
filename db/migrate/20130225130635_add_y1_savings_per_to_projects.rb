class AddY1SavingsPerToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :y1_savings_per, :decimal, :precision => 4, :scale => 3
  end
end
