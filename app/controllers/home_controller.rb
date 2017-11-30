class HomeController < ApplicationController

  def add_friend
    # @account = 
    # @contact = Account.find()
  end 

  def home
    @qr = RQRCode::QRCode.new( current_user.id.to_s , size: 4)

  end

end
