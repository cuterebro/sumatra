# frozen_string_literal: true

require 'rails_helper'

describe Post do
  let(:space) { create(:space) }
  let(:feed) { create(:feed, space:) }
  let(:user) { create(:user, space:)}
  let(:profile) { create(:profile, users: [user], space:)}
  let(:other_space) { create(:space, :other) }
  let(:other_feed) { create(:feed, :other, space:) }
  let(:other_profile) { create(:profile, :other, users: [user], space:)}

  it 'should creates post' do
    expect{
      post = create(:post, feed:, profile:)
    }.to change{ feed.posts.count }.by(1)
    .and change{ profile.posts.count }.by(1)
  end

  it 'should not allow to create posts in other space feed' do
    feed = create(:feed, space: other_space)
    expect {
      create(:post, feed:, profile:)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not allow to change immutables' do
    post = create(:post, feed:, profile:)
    expect {
      post.update(feed: other_feed)
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)    
    expect {
      post.update(profile: other_profile)
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)    
    expect {
      post.update(content: 'other content')
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
  end
end
