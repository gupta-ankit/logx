# frozen_string_literal: true
require 'logx/buffer'

RSpec.describe Logx::Buffer do
  it 'returns empty contents if nothing is appended' do
    expect(Logx::Buffer.new.contents).to eq({})
  end

  it 'appends key-value pairs' do
    buffer = Logx::Buffer.new
    buffer.append(request_id: 1, user_id: 2)
    expect(buffer.contents).to eq({request_id: 1, user_id: 2})
  end

  it 'overwrites the keys' do
    buffer = Logx::Buffer.new
    buffer.append(request_id: 1, user_id: 2)
    buffer.append(request_id: 'abcd')
    expect(buffer.contents[:request_id]).to eq('abcd')
  end
end
