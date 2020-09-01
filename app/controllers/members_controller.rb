class MembersController < ApplicationController
  def edit
  end

  def show
  	@member = Member.find(params[:id])
  end
end
