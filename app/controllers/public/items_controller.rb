class Public::ItemsController < ApplicationController
  def index
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
end 