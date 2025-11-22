class User < ApplicationRecord
  attr_readonly :space_id, :name, :email

  belongs_to :space

  has_many :user_profiles
  has_many :profiles, through: :user_profiles, dependent: :destroy
end
