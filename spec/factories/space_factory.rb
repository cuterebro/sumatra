# frozen_string_literal: true

FactoryBot.define do
  factory :space do
    host { 'localhost' }
    title { 'First space' }
    mode { 'public' }

    trait :other do 
      host { 'second.localhost' }
      title { 'Second space' }
    end

    trait :with_feed do
      after(:create) { |space, _| create(:feed, space:) }
    end
  end
end
