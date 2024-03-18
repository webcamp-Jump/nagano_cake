class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page])
    @total_items = @items.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private

  def item_params
  params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_active)
  end

end