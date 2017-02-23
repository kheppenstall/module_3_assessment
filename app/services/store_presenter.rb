class StorePresenter

  attr_reader :stores, :store_count

  def self.by_zip(zip)
    store_service_response = StoreService.by_zip(zip)
    raw_stores = store_service_response[:stores]
    store_count = store_service_response[:total]

    new(raw_stores, store_count)
  end

  def initialize(raw_stores, store_count)
    @stores = raw_stores.map { |raw_store| Store.new(raw_store) }
    @store_count = store_count
  end
end