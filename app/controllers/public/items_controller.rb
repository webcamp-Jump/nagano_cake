class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  
  private
  
  def item_params
    params.require(:items).permit(:genre_id,:name,:introduction,:image,:pric,:is_active)
  end
end
