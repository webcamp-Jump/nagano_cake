class Public::OrdersController < ApplicationController
before_action :authenticate_customer!
  def new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

  def index
   @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

