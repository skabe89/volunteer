class Community < ApplicationRecord
  belongs_to :state
  has_many :projects
  has_many :users
end
