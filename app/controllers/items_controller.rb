class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def search
    bbs = BestBuyService.new
    found_items = bbs.search(params[:search][:search_criteria])
    binding.pry
  end
end
