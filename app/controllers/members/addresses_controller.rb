class Members::AddressesController < Members::Base

  before_action :set_member

  def index
    @address = Address.new
    @addresses = @member.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.member_id = current_member.id
    address.save
    redirect_to member_addresses_path
  end

  def edit
    @address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to member_addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path

  end

  private

  def set_member
    @member = current_member
  end
  def address_params
    params.require(:address).permit(:poatal_code, :address, :name)
  end

end
