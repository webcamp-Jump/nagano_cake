class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(4)
    @orders = Order.all
    @genres = Genre.all
  end

  def about
  end
end
