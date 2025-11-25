# frozen_string_literal: true

require 'rails_helper'

describe FeedHelper, type: :helper do
  describe 'time_ago_string' do
    it 'should return time ago in words' do
      expect(helper.time_ago_string(1200.days.ago)).to eq('3y ago')
      expect(helper.time_ago_string(100.days.ago)).to eq('100d ago')
      expect(helper.time_ago_string(12.hours.ago)).to eq('12h ago')
      expect(helper.time_ago_string(40.minutes.ago)).to eq('40m ago')
      expect(helper.time_ago_string(30.seconds.ago)).to eq('Now')
    end
  end
end
