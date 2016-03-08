require 'net/http'
require 'json'

class BestBuyService

  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "http://api.bestbuy.com/v1/") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def search(search_criteria)
    parse(connection_settings("products(search=#{search_criteria})"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection_settings(path)
    connection.get do |req|
      req.url (path)
      req.params['format'] = 'json'
      req.params['apiKey'] = ENV['BEST_BUY_KEY']
      req.params['show'] = 'customerReviewAverage,sku,name,salePrice,'
    end
  end

end
