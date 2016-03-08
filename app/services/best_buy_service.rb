require 'net/http'
require 'json'

class BestBuyService

  attr_reader :connection

  def initialize
    @connection = Faraday.new(:url => "//api.bestbuy.com/v1/") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def search
    parse(connection_settings("products"))
  end

  private

  def parse(connection)
    JSON.parse(connection)
  end

  def connection_settings(path)
    connection.get do |req|
      req.url (path)
      req.headers['Content-Type'] = "application/json"
    end
  end

end
