class AddY1SavingsperToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :y1_savings_per, :decimal
  end
end
