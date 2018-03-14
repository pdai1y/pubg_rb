
require 'spec_helper'

RSpec.describe PUBG::Client do
  let(:api_key) { '097cd31f3a08fef202b3eefd18853d69' }
  let(:client) { PUBG::Client.new(api_token: api_key, platform: 'pc', region: 'na') }

  describe '#new' do
    it 'should have an api key' do
      expect(client.headers['Authorization']).not_to eql(nil)
    end

    it 'should not be nil' do
      expect(client).not_to eql(nil)
    end

    context 'when either platform or region is missing' do
      it 'should raise an error' do 
        expect { PUBG::Client.new(api_token: api_key) }.
          to raise_error(ArgumentError, "Requires both a platform and region.")
      end
    end
  end
end

