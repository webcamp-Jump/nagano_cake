class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      flash[:success] = "注文明細を更新しました"
      redirect_to admin_order_path(@order_detail.order)
    else
      render 'admin/orders/show'
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
