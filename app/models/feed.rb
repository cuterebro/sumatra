class Feed < ApplicationRecord
  attr_readonly :space_id

  belongs_to :space
  has_many :posts, dependent: :destroy
end
