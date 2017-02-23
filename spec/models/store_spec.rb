require 'rails_helper'

describe 'Store model' do
  context 'raw store hash' do
    it 'initializes and can read attributes' do
      store = Store.new(raw_store)

      expect(store.city).to         eq raw_store[:city]
      expect(store.name).to         eq raw_store[:longName]
      expect(store.distance).to     eq raw_store[:distance]
      expect(store.store_type).to   eq raw_store[:storeType]
      expect(store.phone_number).to eq raw_store[:phone]
    end
  end
end
