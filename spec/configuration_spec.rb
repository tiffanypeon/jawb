describe 'configuration' do

  let(:keys) { Jawb::Configuration::CONFIG_KEYS }
  let(:key) { keys.sample }

  after { Jawb.reset }

  it 'sets config keys' do
    Jawb.configure do |config|
      config.public_send("#{key}=", key)
      expect(Jawb.public_send(key)).to eq key
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
