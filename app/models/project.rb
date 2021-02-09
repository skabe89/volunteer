class Project < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :users, through: :pledges
  has_one :state, through: :community

  validates :title, presence: true
  validates :date, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :estimated_hours, presence: true
  validates :estimated_hours, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  # validates :min_volunteers, presence: true

  scope :in_date_user_projects, ->(user, today) {where('community_id = ? and date >= ?', user, today)}
  scope :user_organized_projects, ->(user_id) {where('organizer_id = ?', user_id)}


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
