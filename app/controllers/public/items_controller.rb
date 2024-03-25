class Public::ItemsController < ApplicationController

  def index
    if params[:genre_id].present?
      @genre = Genre.find_by(id: params[:genre_id])
      @items = Item.where(genre_id: params[:genre_id], is_active: true).page(params[:page]).per(12)
    else
      @items = Item.where(is_active: true).search(params[:q]).page(params[:page]).per(12)
    end
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