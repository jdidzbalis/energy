class AddFundingOfferedToProjectFundings < ActiveRecord::Migration
  def change
    add_column :project_fundings, :funding_offered, :integer
  end
end
