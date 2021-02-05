class Project < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :users, through: :pledges
  has_one :state, through: :community

  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :min_volunteers, presence: true
  validates :estimated_hours, presence: true

  def organizer
    User.find_by(id: self.organizer_id)
  end

  def readable_date
    self.date.strftime("%A, %B %d %Y")
  end

  def start_time
    self.date
  end

end
