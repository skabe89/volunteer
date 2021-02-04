class Community < ApplicationRecord
  belongs_to :state
  has_many :projects
  has_many :users
  validates :location, presence: true

  def location_name
    self.location.capitalize
  end
end
