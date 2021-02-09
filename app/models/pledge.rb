class Pledge < ApplicationRecord
  belongs_to :user
  belongs_to :project
  
  validates :hours, presence: true
  validates :hours, numericality: { only_integer: true }
  validates_inclusion_of :hours, :in => 1..12, message: "must be between 1 and 12"

  scope :project_pledges, ->(project_id) {where('project_id = ?', project_id)}
  scope :ordered_user_pledges, ->(user_id) {where('user_id = ?', user_id).includes(:project).order("projects.date")}

end
