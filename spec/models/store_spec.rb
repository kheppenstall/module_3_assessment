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

def raw_store
  { :storeId        =>2740,
    :storeType      =>"Mobile SAS",
    :tradeIn        =>nil,
    :name           =>"CHERRY CREEK MALL",
    :longName       =>"BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER",
    :address        =>"3000 EAST FIRST AVE",
    :address2       =>"STE 296",
    :city           =>"DENVER",
    :region         =>"CO",
    :fullPostalCode =>"80206-5637",
    :country        =>"US",
    :tradeIn        =>nil,
    :phone          =>'123-456-789'
  }
end