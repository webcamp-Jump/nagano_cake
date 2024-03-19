# class Public::CartItemsController < ApplicationController
#   before_action :authenticate_customer!

#   def index
#     @cart_items = current_customer.cart_items.includes(:item)
#     @total_price = calculate_total_price(@cart_items)
#   end

#   def create
#     @cart_item = current_customer.cart_items.build(item_id: params[:item_id], amount: params[:amount])
#     if @cart_item.save
#       redirect_to public_cart_items_path, notice: '商品をカートに追加しました'
#     else
#       redirect_to public_item_path(params[:item_id]), alert: '商品をカートに追加できませんでした'
#     end
#   end

#   private

#   def calculate_total_price(cart_items)
#     cart_items.sum { |item| (item.item.price * 1.1).floor * item.amount }
#   end
# end


class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to public_cart_items_path, notice: '商品をカートに追加しました。'
    else
      redirect_to root_path, alert: '商品をカートに追加できませんでした。'
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
