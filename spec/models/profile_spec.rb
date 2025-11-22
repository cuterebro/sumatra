require 'rails_helper'

describe Profile do
  let(:space) { create(:space) }
  let(:other_space) { create(:space, host: 'dev.localhost') }
  let(:user) { create(:user, space:) }

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
    profile = create(:profile, space:, users: [user])
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
    profile = create(:profile, space:, users: [user])    
    expect {
      profile.update(space: other_space)
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
    expect {
      profile.update(name: 'other_name')
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
  end

  it 'should not allow to link users from other space' do
    profile = create(:profile, space:, users: [user])
    expect {
      profile.users.push create(:user, :other_one, space: other_space)
    }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
