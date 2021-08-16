class AddStateIdToCommunity < ActiveRecord::Migration[6.1]
  def change
    add_column :communities, :state_id, :integer
  end
end
