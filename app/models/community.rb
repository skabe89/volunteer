class Community < ApplicationRecord
  belongs_to :state
  has_many :projects
  has_many :users

  def location_name
    self.location.capitalize
  end
end
