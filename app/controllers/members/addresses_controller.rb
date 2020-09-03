class Members::AddressesController < ApplicationController
  def index
    @address = Address.new
    @member = current_member
    @addresses = @member.address
  end

  def create
    address = Address.new(address_params)
    address.member_id = current_member
    address.save
    redirect_to member_addresses_path
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path

  end

  private
  def address_params
    params.require(:address).permit(:poatal_code, :address, :name)
  end

end
