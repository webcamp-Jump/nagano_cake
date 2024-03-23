class Public::HomesController < ApplicationController
  def top
    @items = Item.where(is_active: true).order(created_at: :desc).limit(8)
    @orders = Order.all
    @genres = Genre.all
  end

  def about
  end
end
