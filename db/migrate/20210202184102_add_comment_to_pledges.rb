class AddCommentToPledges < ActiveRecord::Migration[6.1]
  def change
    add_column :pledges, :comment, :string
  end
end
