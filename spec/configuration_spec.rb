describe 'configuration' do

  let(:keys) { Jawb::Configuration::VALID_CONFIG_KEYS }
  let(:key) { keys.sample }

  after { Jawb.reset }

  it 'sets config keys' do
    Jawb.configure do |config|
      config.public_send("#{key}=", key)
      expect(Jawb.public_send(key)).to eq key
    end
  end

  it 'returns default values' do
    keys.each do |key|
      expect(Jawb.send(key)).to eq Jawb::Configuration.const_get("DEFAULT_#{key.upcase}")
    end
  end

  describe '#api_key' do
    it 'should return default key' do
      expect(Jawb.api_key).to eq Jawb::Configuration::DEFAULT_API_KEY
    end
  end

  describe '#format' do
    it 'should return default format' do
      expect(Jawb.format).to eq Jawb::Configuration::DEFAULT_FORMAT
    end
  end

  describe '#user_agent' do
    it 'should return default user agent' do
      expect(Jawb.user_agent).to eq Jawb::Configuration::DEFAULT_USER_AGENT
    end
  end

end
