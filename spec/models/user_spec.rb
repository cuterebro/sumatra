# frozen_string_literal: true

require 'rails_helper'

describe User do
  let(:space) { create(:space) }
  let(:other_space) { create(:space, host: 'dev.localhost') }

  it 'should creates users in space' do
    expect {
      user = create(:user, space:)
    }.to change{ space.users.count }.by(1)

    expect { create(:user, space:) }.to raise_error(ActiveRecord::RecordNotUnique)

    expect {
      user = create(:user, space: other_space)
    }.to change{ User.count }.by(1)
     .and not_change{ space.users.count }

    expect {
      other_space.destroy
    }.to change{ User.count }.by(-1)
     .and not_change{ space.users.count }
  end

  it 'should not allow to update immutables' do
    user = create(:user, space:)
    expect {
      user.update(space: other_space)
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
    expect {
      user.update(name: 'other_name')
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
    expect {
      user.update(email: 'other@email.com')
    }.to raise_error(ActiveRecord::ReadonlyAttributeError)
  end

  it 'should have profiles' do
    user = create(:user, space:)
    expect {
      create(:profile, space:, users: [user])    
    }.to change{ user.profiles.count }.by(1)
    
    expect{
      user.destroy
    }.to change{ UserProfile.count }.by(-1)
    .and change{ Profile.count }.by(-1)
  end
end
