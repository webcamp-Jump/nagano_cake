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
        order_detail.making_status = "製作待ち"
        order_detail.save
      end
      render :show
    end
  # リダイレクトを削除して、そのままのページに留まる
  end
#ただし、ページをリロードするとフォームが再送信される可能性があるため、
#更新処理が再度実行されてしまいます。
#この問題を回避するには、Ajaxを使用して非同期更新を行う方法
#が考えられます。

    private

  def order_params
    params.require(:order).permit(:status)
  end

end
