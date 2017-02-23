require 'rails_helper'

describe 'Store Service' do
  context '.conn(zip)' do
    it 'returns a Faraday object' do

      expect(StoreService.conn(1)).to be_a Faraday::Connection
    end
  end

  context '.by_zip' do
    before do
      VCR.insert_cassette 'store_service_response', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns store count of 16 and 10 stores' do
      expected_keys = [:longName, :storeType, :distance, :phone, :city]
      zip = '80202'
      stores_response = StoreService.by_zip(zip)

      expect(stores_response).to be_a Hash
      expect(stores_response).to have_key :total
      expect(stores_response[:total]).to eq 16
      expect(stores_response).to have_key :stores

      raw_stores = stores_response[:stores]

      expect(raw_stores).to be_a Array
      expect(raw_stores.count).to eq 10

      raw_store = raw_stores.first


      expected_keys.each do |key|
        expect(raw_store).to have_key key
      end
    end
  end
end













