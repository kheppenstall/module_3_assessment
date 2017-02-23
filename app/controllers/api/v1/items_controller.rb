class Api::V1::ItemsController < ApplicationController  
  def index
    render json: Item.all
  end

  def show
    if item = find_item
      render json: find_item
    else
      unsuccessful_request
    end
  end

  def destroy
    if item = find_item
      item.delete
      render status: 204, json: 'Item successfully deleted.'
    else
      unsuccessful_request
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render status: 201, json: item
    else
      unsuccessful_request
    end
  end

  private

    def find_item
      Item.find(params[:id]) rescue nil
    end

    def unsuccessful_request
      render status: 400, json: 'Invalid request.'
    end

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end

end