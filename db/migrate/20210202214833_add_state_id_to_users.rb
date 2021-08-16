class AddStateIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :state_id, :integer
  end
end
