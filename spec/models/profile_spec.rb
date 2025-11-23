require 'rails_helper'

describe Profile do
  let(:space) { create(:space) }
  let(:other_space) { create(:space, :other) }
  let(:user) { create(:user, space:) }
  let(:profile) { create(:profile, space:, users: [user]) }
  let(:feed) { create(:feed, space:) }

  it 'should create' do
    expect {
      create(:profile, space:)
    }.to raise_error(ActiveRecord::RecordInvalid)
    expect {
      create(:profile, space:, users: [user])      
    }.to change { Profile.count }.by(1)
    .and change { UserProfile.count }.by(1)

    expect { 
      create(:profile, space:, users: [user])
    }.to raise_error(ActiveRecord::RecordNotUnique)
  end

  it 'should have users' do
    expect {
      profile.users.push create(:user, :other_one, space:)
    }.to change{ profile.users.count }.from(1).to(2)

    expect {
      profile.destroy  
    }.to change{ Profile.count }.by(-1)
    .and change{ UserProfile.count }.by(-2)
    .and not_change{ User.count }
  end

  it 'should not allow update immutables' do
    expect {
      profile.update(space: other_space)
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
    expect {
      profile.update(name: 'other_name')
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
  end

  it 'should not allow to link users from other space' do
    expect {
      profile.users.push create(:user, :other_one, space: other_space)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have posts' do
    expect {
      create(:post, feed:, profile:)
    }.to change{ profile.posts.count }.by(1)

    expect {
      profile.destroy
    }.to change{ Post.count }.by(-1)
    .and change{ feed.posts.count }.by(-1)
  end
end
