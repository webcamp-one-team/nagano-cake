
class Members::MembersController < Members::Base

  def show
    @member = current_member #params[:id]だと今回はurlにidを載せないようにしているのでcurrent_memberにしてログイン者のidを取得しています。オカタク。
  end

  def edit

    @member = current_member
  end
  def update
    @member = current_member
    @member.update(member_params)
    redirect_to home_top_path
  end
  def unsubscribe
    @member = current_member
  end

  def withdraw
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to home_top_path
  end
  def edit_pass
    @member = current_member
  end
  def update_pass
    @member = current_member
    new_password = params[:password]
    password_confirmation = params[:password_confirmation]
    if new_password ==password_confirmation
      if @member.reset_password(new_password,new_password)
       flash[:success]="パスワード変更に成功しました。"
       redirect_to new_member_session_path
       return
      else
        render "edit_pass"
      end
    else
      flash[:error]="パスワードが一致しません。"
      redirect_to members_edit_pass_path
    end
    end

  private
  def member_params
    params.require(:member).permit(:is_deleted, :encrypted_password, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)

  end
end



