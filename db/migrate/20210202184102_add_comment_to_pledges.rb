class AddCommentToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :comment, :string
  end
end
