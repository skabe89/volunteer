class Project < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :users, through: :pledges
end
