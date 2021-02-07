class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :hours, presence: true

  scope :project_pledges, ->(project_id) {where('project_id = ?', project_id)}
  scope :ordered_user_pledges, ->(user_id) {where('user_id = ?', user_id).includes(:project).order("projects.date")}

  # @user_pledges = Pledge.where(user_id: @user.id).includes(:project).order("projects.date")
  # @pledges = Pledge.where(project_id: @project.id).reverse[0,3]
end
