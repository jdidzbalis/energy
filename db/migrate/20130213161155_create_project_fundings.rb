class CreateProjectFundings < ActiveRecord::Migration
  def change
    create_table :project_fundings do |t|
      t.integer :user_id
      t.integer :investment_id
      t.timestamps
      t.string :state
     
    end

    
    add_index :project_fundings, [:user_id, :investment_id, :state]
  end
end
