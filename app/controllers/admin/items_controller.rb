class Admin::ItemsController < ApplicationController
 before_action :authenticate_admin!
  def index
   @items = Item.search(params[:q]).page(params[:page])
  end

  def new
   @item = Item.new
   @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
     flash[:notice] = "商品を追加しました。"
      redirect_to admin_item_path(@item.id)
    else
     flash.now[:alert] = "商品の追加に失敗しました。"
      render new_admin_item_path
    end
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
   @item = Item.find(params[:id])
   @genres = Genre.all
  end

 def update
   @item = Item.find(params[:id])
   @genres = Genre.all
   if @item.update(item_params)
    flash[:notice] = "状態を変更しました。"
     redirect_to admin_item_path(@item.id)
   else
     flash.now[:alert] = "状態の変更に失敗しました。"
     render :edit
   end
 end

    private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end