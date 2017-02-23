class StoresController < ApplicationController
  def index
    @stores = Store.by_zip(params[:q])
  end

end