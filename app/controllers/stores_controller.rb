class StoresController < ApplicationController
  def index
    @store_presenter  = StorePresenter.by_zip(params[:q])
  end
end