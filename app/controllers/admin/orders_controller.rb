class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page]).per(10).order('created_at DESC')
    @order_details = OrderDetail.where(order_id: @orders.pluck(:id))
  end


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

def update
  @order_detail = OrderDetail.find(params[:id])
  @order_detail.update(making_status: params[:order_detail][:making_status])
  order = @order_detail.order
  
  if params[:order_detail][:making_status] == "in_making"
    order.update(status: "making")
  elsif is_all_order_details_making_completed(order)
    order.update(status: 'shipping_in_process')
  end
  
  flash[:notice] = "更新に成功しました。"
  redirect_to admin_order_path(@order_detail.order.id)
end

    private

  def order_params
   params.require(:order).permit(:status, order_details_attributes: [:making_status])
  end
  
  def is_all_order_details_making_completed(order)
    order.order_details.all? { |order_detail| order_detail.making_status == 'making_completed' }
  end

  def is_all_order_details_making_completed(order)
      order.order_details.each do |order_detail|
        if order_detail.making_status != 'making_completed'
          return false 
        end
      end
      return true 
    end  
end
