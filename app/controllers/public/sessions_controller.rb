# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_customer!

  def after_sign_in_path_for(resource)
     public_items_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end

  # ログイン画面から送られたemailを確認し、Customerモデルに該当するemailのアカウントが存在するかを検索する
  def create
    self.resource = resource_class.find_for_database_authentication(email: params[:customer][:email])
    return unless resource

    # パスワードが一致しない場合、メソッドを終了する
    unless resource.valid_password?(params[:customer][:password])
      flash.now[:alert] = "Invalid email or password."
      render :new
      return
    end

    # アカウントがアクティブでない場合、サインアップ画面に遷移する
    if resource.is_active?
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      redirect_to new_customer_registration_path, alert: "Your account is inactive. Please sign up again."
    end
  end

  # ログアウト後のリダイレクト先
  private
  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end




  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end