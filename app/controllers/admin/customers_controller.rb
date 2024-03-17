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
  end

  def update
  end
end
