require 'net/http'
require 'json'

class Api::V1::ItemsController < Api::V1::ApiController
  respond_to :json

  def index
    @items = Item.all.select("name, description, image_url")

    respond_with :api, :v1, @items
  end

  def show
    @item = Item.select("name, description, image_url").find(params[:id])

    respond_with :api, :v1, @item
  end

  def destroy
    @item = Item.find(params[:id])
  end
end
