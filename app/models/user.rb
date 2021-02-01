class User < ApplicationRecord
  belongs_to :community
  has_many :pledges
  has_many :projects, through: :pledges

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
end
