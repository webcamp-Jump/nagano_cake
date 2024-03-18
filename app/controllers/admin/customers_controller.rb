class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!
  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page]) #ページネーション
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


  def update
    @customer = Customer.find(params[:id])
    if @customer.update!(customer_params)
      redirect_to admin_customers_path, notice: "会員情報が更新されました"
    else
      render :edit
    end
  end

  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :telephone_number, :postal_code, :address, :email, :is_active)
  end
  
end

