class User < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :projects, through: :pledges
end
