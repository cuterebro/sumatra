# frozen_string_literal: true

require 'rails_helper'

describe Space do
  it 'should creates unique spaces' do
    space = create(:space)
    expect(space).to be_present
    expect(Space.count).to be(1)
    expect{ create(:space) }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'should have feeds connected' do
    space = create(:space, :with_feed)
    expect(space.feeds.count).to eq(1)
    feed = space.feeds.first
    expect(feed).to be_present
    expect(feed.space).to eq(space)
    expect {
      space.destroy
    }.to change { Feed.count }.by(-1)
  end
end
