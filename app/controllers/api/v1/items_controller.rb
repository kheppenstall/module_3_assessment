class Api::V1::ItemsController < ApplicationController  
  def index
    render json: Item.all
  end

  def show
    render json: find_item
  end

  def destroy
    find_item.delete
    render status: 204, json: 'Item successfully deleted.'
  end

  private

    def find_item
      Item.find(params[:id])
    end

end