class Project < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :users, through: :pledges

  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :min_volunteers, presence: true
  validates :estimated_hours, presence: true
end
