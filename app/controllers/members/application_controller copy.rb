class Members::ApplicationController < ActionController::Base
  layout 'members'
before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
      member_top_path
  end


  def after_sign_out_path_for(resource)
      new_member_session_path
  end


  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :last_name,
      :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])# 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
      devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :encrypted_password, :last_name,
      :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
  end
#オカタクメモ1：上記のcofigure(以下ストロングパラメーターが分かりやすいのでそう呼ぶ)以下の記載がないとunpermitted.parameters: :カラム名とコマンドプロンプトに表れていた。
#実際にパラメータの受け渡しがされていなかったので、次のページでは受け取ったパラメータが表示されるはずが空白になっていた。ようこそ～さん！の～の部分のこと。
end