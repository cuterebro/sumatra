# frozen_string_literal: true

require 'rails_helper'

describe Core do
  let(:core) { Class.new(Core).instance }

  it 'should load plugins' do
    expect(Core.config).to receive(:plugins).and_return([:dummy])
    expect(core.has_plugin?(:dummy)).to be true
  end

  it 'should load dependend plugins' do
    class FooPlugin < Plugin
      depends_on :dummy
    end
    expect(Core.config).to receive(:plugins).and_return([:foo])
    expect(core.has_plugin?(:dummy)).to be true
  end

end
