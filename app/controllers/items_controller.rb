class ItemsController < ApplicationController

  respond_to :json

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def search
    bbs = BestBuyService.new
    @found_items = bbs.search(params[:search][:search_criteria])

    respond_with @found_items[:products], location: -> { search_path }
  end
end
