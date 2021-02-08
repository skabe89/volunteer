class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :hours, presence: true

  scope :project_pledges, ->(project_id) {where('project_id = ?', project_id)}
  scope :ordered_user_pledges, ->(user_id) {where('user_id = ?', user_id).includes(:project).order("projects.date")}

end
