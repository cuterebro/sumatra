class Post < ApplicationRecord
  attr_readonly :feed_id, :profile_id, :content

  belongs_to :feed
  belongs_to :profile

  validate :same_space_validation

  private

  def same_space_validation
    if feed.space_id != profile.space_id
      errors.add(:feed, "should be from the same space")
    end
  end  
end
