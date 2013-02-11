class CreateProjectFundings < ActiveRecord::Migration
  def change
    create_table :project_fundings do |t|
    	t.integer :user_id
    	t.integer :project_id
      t.timestamps
    end

    add_index :project_fundings, [:user_id, :project_id]
  end
end
