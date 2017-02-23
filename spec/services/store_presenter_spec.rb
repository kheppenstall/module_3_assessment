require 'rails_helper'

describe 'Store Presenter' do
  context '.by_zip(zip)' do

     before do
      VCR.insert_cassette 'stores_presenter', record: :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it 'returns store count and stores' do
      zip = '80202'
      presenter = StorePresenter.by_zip(zip)

      expect(presenter).to be_a StorePresenter
      expect(presenter.store_count).to eq 16
      
      stores = presenter.stores

      expect(stores).to be_a Array
      expect(stores.count).to eq 10
      expect(stores.first).to be_a Store
    end
  end
end