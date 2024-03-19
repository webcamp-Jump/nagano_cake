class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.customar_id = current_customer.id
    end

    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def thanks
  end

  def create
    order = Order.new(order_params)
    order.shipping_cost = 800 # 送料を設定
    order.total_payment = calculate_total_payment(order) # 総支払い額を計算
    order.save!

    create_order_details(order)

    CartItem.destroy_all

    redirect_to thanks_public_orders_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :status)
  end

  def calculate_total_payment(order)
    # 注文総額の計算ロジックをここに追加する
  end

  def create_order_details(order)
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_details = OrderDetail.new(
        order_id: order.id,
        item_id: cart_item.item.id,
        price: cart_item.item.price,
        number: cart_item.amount,
        manufacture_status: 0
      )
      order_details.save!
    end
  end
end
