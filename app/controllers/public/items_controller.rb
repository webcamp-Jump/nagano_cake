class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).page(params[:page]).per(12)
    @total_items = @items.total_count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private

  def item_params
  params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_active)
  end

end