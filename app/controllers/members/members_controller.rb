
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
    redirect_to member_top_path
  end
  def unsubscribe
    @member = current_member
  end

  def withdraw
  	@member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to member_top_path
  end

  private
  def member_params
    params.require(:member).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)

  end
end

