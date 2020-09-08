class Admins::Base < ApplicationController
  layout 'admins'

  before_action :authenticate_admin!

end