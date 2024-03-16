class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @total_items = @items.count
  end

  def show
  end
end
