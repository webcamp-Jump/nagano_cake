class Public::AddressesController < ApplicationController
before_action :authenticate_customer!


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "登録情報が登録されました。"
    else
      flash.now[:alert] = "必要な情報を入力してください"
      render :index
    end
  end

  def index
    @addresses = current_customer.addresses
    @address = @addresses.first
  end

  def edit
    @address = Address.find(current_address.id)
  end


  def update
    @address = Address.find(current_address.id)
    if @address.update(addrese_params)
      redirect_to address_path, notice: "登録情報が更新されました。"
    else
      flash.now[:alert] = "必要な情報を入力してください"
      render :edit
    end
  end

  def destroy
    @address = Address.find(current_address.id)
    @address.update(addrese_params)
    redirect_to address_path, notice: "登録情報が更新されました。"
  end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
