class AddStateIdToCommunity < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :state_id, :integer
  end
end
