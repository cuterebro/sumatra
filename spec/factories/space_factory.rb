# frozen_string_literal: true

FactoryBot.define do
  factory :space do
    host { 'localhost' }
    title { 'First space' }
    mode { 'public' }
  end

  trait :with_feed do |space|
    after(:create) { |space, _| create(:feed, space:) }
  end
end
