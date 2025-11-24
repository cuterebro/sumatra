class Feed < ApplicationRecord
  attr_readonly :space_id

  belongs_to :space
  has_many :posts, dependent: :destroy

  scope :default, -> { where(default: true) }
end
