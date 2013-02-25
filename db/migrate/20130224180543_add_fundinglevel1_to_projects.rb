class AddFundinglevel1ToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :fundinglevel1, :integer
    add_column :projects, :fundinglevel2, :integer
    add_column :projects, :fundinglevel3, :integer
    add_column :projects, :fundinglevel4, :integer
    add_column :projects, :fundinglevel5, :integer
  end
end
