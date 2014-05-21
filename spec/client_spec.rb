require 'spec_helper'

describe Jawb::Client do
  let(:connection) { double(:http_connection) }
  let(:client) { Jawb::Client.new }
  let(:config_keys) { Jawb::Configuration::CONFIG_KEYS }

  it 'inherits config' do
    expect(client).to respond_to(config_keys.sample)
  end

end
