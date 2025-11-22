class Feed < ApplicationRecord
  attr_readonly :space_id

  belongs_to :space
end
