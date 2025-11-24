# frozen_string_literal: true
require 'faker'

desc 'Generate fake users and posts'
namespace :data do
  task seed_posts: :environment do
    return unless Rails.env.development?

    space = Space.first
    ActiveRecord::Base.transaction do
      space.users.destroy_all
      space.feeds.destroy_all

      feed = Feed.create(title: 'Index', default: true, space:)
      100.times do
        user = User.create(name: Faker::Internet.unique.username, email: Faker::Internet.unique.email, space:)
        Profile.create(name: user.name, bio: Faker::Quote.famous_last_words, users: [user], space:)
        rand(2).times do
          Profile.create(name: Faker::Internet.unique.username, bio: Faker::Quote.famous_last_words, users: [user], space:)
        end

        user.profiles.each do |profile|
          rand(5).times do
            content = Faker::Hipster.paragraphs.map{|p| "<p>#{p}</p>"}.join
            created_at = Faker::Time.between(from: DateTime.now - 1.month, to: DateTime.now)
            Post.create(feed:, profile:, content:, created_at:)
          end
        end
      end
      puts "#{Post.count} of posts generated"
    end
  end
end
