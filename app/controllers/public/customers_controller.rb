class Public::CustomersController < ApplicationController
before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to public_customers_path, notice: "登録情報が更新されました。"
    else
      flash.now[:alert] = "必要な情報を入力してください"
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation)
  end

  # def ensure_correct_customer
  # customer = Customer.find(params[:id])
  # unless customer.id == current_customer.id
  #   redirect_to root_path
  # end
  # end

end
