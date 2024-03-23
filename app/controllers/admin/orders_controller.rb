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

  # 製作中の商品があるかどうかを確認
  if @order_details.any? { |order_detail| order_detail.making_status == "製作中" }
    @order.update(status: "製作中")
  else
    @order.update(status: "入金確認") # 製作中の商品がない場合は注文ステータスを元に戻す
  end

  # 全ての商品が製作完了かどうかを確認
  if @order_details.all? { |order_detail| order_detail.making_status == "製作完了" }
    @order.update(status: "発送準備中")
  end

  @order.save # 自動更新のために変更内容を保存する

  render :show
end



    private

  def order_params
    params.require(:order).permit(:status)
  end

end
