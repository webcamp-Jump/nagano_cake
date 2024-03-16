class Admin::ItemsController < ApplicationController
 before_action :authenticate_admin!
  def index
  end

  def new
   @item = Item.new
  end

  def create
   item = Item.new(item_params)
   item.save
   redirect_to admin_item_path(:id)
  end

  def show
   @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

    private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end

end