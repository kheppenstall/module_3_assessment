class StoreService
  def self.conn(zip)
    Faraday.new(url: "https://api.bestbuy.com/v1/stores(area(80202,25))") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.by_zip(zip)
    response = conn(zip).get do |req|
      req.params['apiKey']    = ENV['best_buy_api_key']
      req.params['format']   =  'json'
    end

    result = JSON.parse(response.body, symbolize_names: true)
  end
end
