# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    space { build(:space) }
    name { 'cuterebro' }
    email { 'cuterebro@gmail.com' }

    trait :other_one do
      name { 'someguy' }
      email { 'someguy@gmail.com' }
    end
  end
end
