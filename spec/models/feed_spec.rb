# frozen_string_literal: true

require 'rails_helper'

describe Feed do
  let(:space) { create(:space) }

  it 'should creates feeds' do
    feed = create(:feed, space:)
  end
end
