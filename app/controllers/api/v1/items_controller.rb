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

    if @item.destroy
      redirect_to root_url, status: 204
    else
      redirect_to root_url, status: 404
    end
  end

  def create
    @item = Item.create(name: params[:name],
                        description: params[:description],
                        image_url: params[:image_url]
                        )

    if @item
      respond_with(@item, status: 201)
    else
      redirect_to root_url, status: 404
    end
  end
end
