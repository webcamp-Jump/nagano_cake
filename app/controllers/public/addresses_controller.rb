class Public::AddressesController < ApplicationController
before_action :authenticate_customer!


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "配送先が登録されました。"
    else
      flash.now[:alert] = "必要な情報を入力してください"
      render :index
    end
  end

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end


  def edit
    @address = Address.find(params[:id])
  end

  def update
  @address = Address.find(params[:id])
  if @address.update(address_params)
    redirect_to addresses_path, notice: "変更内容が保存されました。"
  else
    render :edit
  end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path, notice: "登録情報が削除されました。"
  end


  private

  def address_params
   params.require(:address).permit(:postal_code, :address, :name)
  end

end
