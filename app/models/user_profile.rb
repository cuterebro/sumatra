class UserProfile < ApplicationRecord
  belongs_to :user
  belongs_to :profile, dependent: :destroy

  validate :same_space_validation

  private

  def same_space_validation
    if user.space_id != profile.space_id
      errors.add(:profile, "should be from the same space")
    end
  end
end
