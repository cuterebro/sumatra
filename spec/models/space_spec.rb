# frozen_string_literal: true

require 'rails_helper'

describe Space do
  let(:space) { create(:space) }
  it 'should creates unique spaces' do
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

  it 'should have users connected' do
    expect{
      create(:user, space:)
    }.to change{ space.users.count }.by(1)
    expect {
      space.destroy
    }.to change { User.count }.by(-1)
  end

  it 'should have profiles connected' do
    user = create(:user, space:)
    expect{
      create(:profile, space:, users: [user])
    }.to change{ space.profiles.count }.by(1)
    expect {
      space.destroy
    }.to change { Profile.count }.by(-1)
    .and change { UserProfile.count }.by(-1)
  end

  it 'should not allow to change host name' do
    expect {
      space.update(host: 'other.host.name')
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
  end
end
