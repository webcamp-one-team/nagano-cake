# frozen_string_literal: true

class Admins::SessionsController < Devise::SessionsController
  layout 'admins'

  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
      admins_path
  end

  def after_sign_out_path_for(resource)
      new_admin_session_path
  end


  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
#オカタクメモ1：上記のcofigure(以下ストロングパラメーターが分かりやすいのでそう呼ぶ)以下の記載がないとunpermitted.parameters: :カラム名とコマンドプロンプトに表れていた。
#実際にパラメータの受け渡しがされていなかったので、次のページでは受け取ったパラメータが表示されるはずが空白になっていた。ようこそ～さん！の～の部分のこと。



  # before_action :configure_sign_in_params, only: [:create]

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
end
