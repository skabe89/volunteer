class User < ApplicationRecord
  belongs_to :state, optional: true
  belongs_to :community, optional: true
  has_many :pledges
  has_many :projects, through: :pledges

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  accepts_nested_attributes_for :community

  def community_attributes=(params)
    @community = Community.where(:state_id => self.state_id, :location => params[:location].downcase).first_or_create
    self.community = @community
  end
end
