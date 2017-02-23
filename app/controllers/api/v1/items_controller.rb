class Api::V1::ItemsController < ApplicationController  
  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    render status: 204, json: 'Item successfully deleted.'
  end

end