# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  layout 'members'
  before_action :configure_permitted_parameters, if: :devise_controller?

   before_action :reject_user, only: [:create]

    def after_sign_in_path_for(resource)
        items_path
    end

    def after_sign_out_path_for(resource)
        new_member_session_path
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :last_name,
        :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])# 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password, :last_name,
        :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
    end
  #オカタクメモ1：上記のcofigure(以下ストロングパラメーターが分かりやすいのでそう呼ぶ)以下の記載がないとunpermitted.parameters: :カラム名とコマンドプロンプトに表れていた。
  #実際にパラメータの受け渡しがされていなかったので、次のページでは受け取ったパラメータが表示されるはずが空白になっていた。ようこそ～さん！の～の部分のこと。
  # before_action :configure_sign_in_params, only: [:create]

 def reject_user
    @member = Member.find_by(email: params[:member][:email].downcase)
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_member_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end

  #このアクションはログインが正常にできた場合は走らない。
  #30行目はuse.rbで定義したメソッドを使っていく。
  #31行目はMemberモデルのemailカラムを利用して@memberに入るmembersテーブルの1レコードすべてを取得している。.downcaseは大文字を小文字に変えるメソッド。
  #今回のpasswordは人によっては大文字を記入する人もいるのでその大文字を小文字に変えることを目的にしている。メンター曰くよく使われるメソッドとのこと。
  #32行目は@memberに値があるかどうかを見ている。なければelse「flash[:error] = "必須項目を入力してください。"」が走る。
  #33行目の左辺はdebise側が用意しているvalid_passwordメソッドを使用。@memberのpasswordカラムの値とsessionsコントローラーのログイン画面で入力してPOSThttpメソッドで送られてきたpasswordの値を比較している。
  #両者の値が合致すればtrueを合致しなければfalseを返す。今回のvalid_password?メソッドはsessionsコントローラーのログイン画面で入力した値に暗号化をしてくれる。
  #passwordカラムはエンジニア側からでも暗号化された状態で管理される。ユーザー以外は知ることが出来ないように暗号化されてコマンドプロンプトなどにも表示される。valid_passwordメソッドを使用しないと
  #@memberの値はsessionsコントローラーに打ち込まれた値と絶対に合致することがないのでvalid_passwordメソッドを使用。
  # (@member.active_for_authentication? == false)はuser.rbに書いてあるメモを参照。書いてあることは@memberのis_deletedカラムの値がtrueかfalseか判断。
  #33行目の左辺と右辺が&&によって比較されている。(@member.valid_password?(params[:member][:password])がtrueで(@member.active_for_authentication? == false)がtrueなら
  #34行目が表示される。32行目の@memberに値がない、33行目で両辺どちらかがfalseなら38行目が表示される。
  #オカタクメモ

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
