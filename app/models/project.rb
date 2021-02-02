class Project < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :users, through: :pledges

  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :min_volunteers, presence: true
  validates :estimated_hours, presence: true

  def organizer
    User.find_by(id: self.organizer_id)
  end

end
