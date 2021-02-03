class State < ApplicationRecord
  has_many :users
  has_many :communities
  has_many :users, through: :communities
  has_many :projects, through: :communities

end