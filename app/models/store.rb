class Store
  def self.by_zip(zip)
    raw_stores = StoreService.by_zip(zip)
  end
end