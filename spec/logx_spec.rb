# frozen_string_literal: true

require 'logx/current_buffer'

RSpec.describe Logx do
  it "has a version number" do
    expect(Logx::VERSION).not_to be nil
  end

  it 'can append structured tags' do
    Logx.append(request_id: '123456')
  end

  it 'can append arbitrary key value pairs' do
    Logx.append(request_id: '123456', user_id: 'abcd')
  end
end
