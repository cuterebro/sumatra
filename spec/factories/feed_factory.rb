# frozen_string_literal: true

FactoryBot.define do
  factory :feed do
    space { build(:space) }
    title { 'The Feed' }
    default { true }

    trait :other do
      title { 'The other feed' }
      default { false }   
    end
  end
end
