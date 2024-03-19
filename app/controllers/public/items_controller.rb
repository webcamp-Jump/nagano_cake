class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page])
    @total_items = Item.all.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_customer.cart_items.find_by(item_id: @item.id)
     
  end

  private

  def item_params
  params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_active)
  end

end