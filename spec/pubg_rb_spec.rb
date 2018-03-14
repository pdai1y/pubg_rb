RSpec.describe PUBG do
  let(:api_key) { '097cd31f3a08fef202b3eefd18853d69' }
  let(:client) { PUBG.new(api_token: api_key, platform: 'pc', region: 'na') }

  it "has a version number" do
    expect(PUBG::VERSION).not_to be nil
  end

  describe '#new' do
    it 'should return a client object' do
      expect(client).to be_a(PUBG::Client)
    end

    it 'should have an api key' do
      expect(client.headers['Authorization']).not_to eql(nil)
    end

    it 'should not be nil' do
      expect(client).not_to eql(nil)
    end
  end

  describe '#shards' do
    let(:shards) { PUBG.shards }

    it 'should return a hash of currently defined shards' do
      expect(shards).to be_a(Hash)
    end
  end

end
