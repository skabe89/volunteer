class AddMinimumVolunteersToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :min_volunteers, :string
  end
end
