class CreateProjectReturns < ActiveRecord::Migration
  def change
    create_table :project_returns do |t|
    	t.integer :y1
    	t.integer :y2
    	t.integer :return_energysavings
    	t.integer :return_energyprice
    	t.integer :return_costsavings

      t.timestamps
    end
  end
end
