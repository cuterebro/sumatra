class Profile < ApplicationRecord
  attr_readonly :space_id, :name
  belongs_to :space

  has_many :user_profiles, dependent: :destroy
  has_many :users, through: :user_profiles
  validates_presence_of :users
end
