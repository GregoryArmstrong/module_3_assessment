require 'net/http'
require 'json'

class Api::V1::ItemsController < Api::V1::ApiController
  respond_to :json

  def index
    @items = Item.all
    binding.pry
    respond_with :api, :v1, @items
  end
end
