class Public::CustomersController < ApplicationController
before_action :authenticate_customer!
  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
  
  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation)
  end
end
