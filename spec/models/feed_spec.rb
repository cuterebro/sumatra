# frozen_string_literal: true

require 'rails_helper'

describe Feed do
  let(:space) { create(:space) }
  let(:feed) { create(:feed, space:) }
  let(:user) { create(:user, space:) }
  let(:profile) { create(:profile, space:, users: [user]) }


  it 'should creates feeds' do
    expect {
      feed = create(:feed, space:)
    }.to change{ space.feeds.count }.by(1)
  end

  it 'should have posts' do
    expect {
      create(:post, feed:, profile:)
    }.to change{ feed.posts.count }.by(1)

    expect {
      feed.destroy
    }.to change{ Post.count }.by(-1)
    .and change{ profile.posts.count }.by(-1)
  end
end
