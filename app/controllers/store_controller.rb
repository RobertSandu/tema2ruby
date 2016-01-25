class StoreController < ApplicationController

  # GET /store
  # GET /store.json
  def index
  	@products = Product.where(Product.arel_table[:quantity].gt(0)).all
  end

  def interfata_angular
  end
end
