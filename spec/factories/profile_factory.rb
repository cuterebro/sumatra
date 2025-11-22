# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    space { build(:space) }
    name { 'cuterebro' }
    bio { 'The boss' }
  end
end
