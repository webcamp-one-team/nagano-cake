class MembersController < Members::ApplicationController

  def show
  	@member = current_member #params[:id]だと今回はurlにidを載せないようにしているのでcurrent_memberにしてログイン者のidを取得しています。オカタク。
  end

  def edit
  	@member = Member.find(current_member.id)
  end
  def update
  	@member = Member.find(current_member.id)
  	if @member.update(member_params)
  	flash[:notice] = "登録情報の更新が成功しました。"
  	redirect_to members_my_page_path
    else
    render "edit"
  end
  end

  def unsubscribe
  end

  def withdrow
  end

  private
  def member_params
    params.require(:member).permit(:email, :last_name, :first_name, :last_name_kana,
  	:first_name_kana, :postal_code, :address, :telephone_number)
  end
end
