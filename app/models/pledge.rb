class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :hours, presence: true

  scope :project_pledges, ->(project_id) {where('project_id = ?', project_id)}
  # @pledges = Pledge.where(project_id: @project.id).reverse[0,3]
end
