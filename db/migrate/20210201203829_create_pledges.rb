class CreatePledges < ActiveRecord::Migration[6.1]
  def change
    create_table :pledges do |t|
      t.integer :hours
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
