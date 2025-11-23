# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    feed { build(:feed) }
    profile { build(:profile) }
    content { 'The best post ever' }
  end
end
