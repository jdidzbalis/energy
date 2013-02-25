class AddY1SavingsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :y1_savings, :integer
    add_column :projects, :y2_savings, :integer
    add_column :projects, :y3_savings, :integer
    add_column :projects, :y4_savings, :integer
    add_column :projects, :y5_savings, :integer
    add_column :projects, :y6_savings, :integer
    add_column :projects, :y7_savings, :integer
    add_column :projects, :y8_savings, :integer
    add_column :projects, :y9_savings, :integer
    add_column :projects, :y10_savings, :integer
  end
end
