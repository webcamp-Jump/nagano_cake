class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
       @order = @order_detail.order
      # 製作中の商品があるかどうかを確認
      # if @order_details.any? { |order_detail| order_detail.making_status == "製作中" }
      if OrderDetail.find_by(making_status: "製作中").present?
         @order.update(status: "製作中")
      else
         @order.update(status: "入金確認") # 製作中の商品がない場合は注文ステータスを元に戻す
      end

      # 全ての商品が製作完了かどうかを確認
      @order_details = @order.order_details
      if @order_details.all? { |order_detail| order_detail.making_status == "製作完了" }
        @order.update(status: "発送準備中")
      end

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
