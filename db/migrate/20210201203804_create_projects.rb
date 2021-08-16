class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.date :date
      t.string :description
      t.integer :estimated_hours
      t.string :address
      t.integer :organizer_id
      t.integer :community_id

      t.timestamps
    end
  end
end
