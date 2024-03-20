class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

<<<<<<< HEAD
  # 注文入力画面
  def new
    @order = Order.new
    @addresses = current_customer.addresses
=======
  def new
    @order = Order.new
    @addresses = Address.all
>>>>>>> origin/develop
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
<<<<<<< HEAD
      @order.customer_id = current_customer.id # Fix typo from 'customar_id' to 'customer_id'
    end
  
    @cart_items = current_customer.cart_items
    @sum = calculate_order_total(@cart_items)
    render :confirm
=======
      @order.end_user_id = current_customer.id
    end

    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end

  def thanks
>>>>>>> origin/develop
  end

  def create
<<<<<<< HEAD
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.total_payment = @order.shipping_cost + params[:order][:order_total].to_i
    
    if @order.save
      create_order_details(@order)
      current_customer.cart_items.destroy_all # CartItem.destroy_all を CartItem.where(customer_id: current_customer.id)に置き換え
      redirect_to thanks_public_orders_path
    else
      @addresses = current_customer.addresses
      render :new
    end
=======
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price_excluding_tax
      @order_details.number = cart_item.amount
      @order_details.manufacture_status = 0
      @order_details.save!
    end

    CartItem.destroy_all
    redirect_to orders_completed_path
>>>>>>> origin/develop
  end

  def index
<<<<<<< HEAD
    @orders = current_customer.orders
=======
    @order = current_customer.orders
>>>>>>> origin/develop
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  private

  def order_params
<<<<<<< HEAD
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :status, :order_total)
  
  end

  # 注文合計金額の計算
  def calculate_order_total(cart_items)
    cart_items.inject(0) { |sum, cart_item| sum + (cart_item.amount * cart_item.item.price) }
  end

  # 注文詳細の作成
  def create_order_details(order)
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_details = OrderDetail.new(
        order_id: order.id,
        item_id: cart_item.item.id,
        price: cart_item.item.price,
        number: cart_item.amount,
        manufacture_status: 0
      )
      order_details.save!
=======
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :amount_requested, :end_user_id, :order_status)
  end

  def cartitem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
>>>>>>> origin/develop
    end
  end
end
