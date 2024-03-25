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
  @order = Order.find(params[:id])
  @order.update(order_params)
  @order_details = @order.order_details

  if @order.status == "入金確認"
    @order_details.each do |order_detail|
      order_detail.update(making_status: "製作待ち")
    end
  end
  @order.save # 自動更新のために変更内容を保存する
  render :show
end


    private

  def order_params
   params.require(:order).permit(:status, order_details_attributes: [:making_status])
  end
  
  def is_all_order_details_making_completed(order)
    order.order_details.all? { |order_detail| order_detail.making_status == 'making_completed' }
  end


end
