class AddMinimumVolunteersToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :min_volunteers, :string
  end
end
