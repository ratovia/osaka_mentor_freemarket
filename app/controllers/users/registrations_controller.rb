class Users::RegistrationsController < Devise::RegistrationsController

  def new
  end

  def create
    super
    @user.uid = session[:uid]
    @user.provider = session[:provider]
    @user.save
  end

end
