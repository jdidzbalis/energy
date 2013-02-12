class AddInvestmentIdToProjectFundings < ActiveRecord::Migration
  def change
    add_column :project_fundings, :investment_id, :integer
  end
end
