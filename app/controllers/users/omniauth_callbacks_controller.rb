class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  ### mercari-study-step5
  ### rails g devise:controllers

  def google_oauth2
    ### mercari-study-step6 
    ### add google callback
    ### gem manual https://github.com/zquestz/omniauth-google-oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      # flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      # session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      # redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      render "devise/registrations/new"
    end
  end
  def facebook
    # @user = User.from_omniauth(request.env['omniauth.auth'])
    # if @user.persisted?
    #   sign_in_and_redirect @user, event: :authentication
    # else
    #   render "devise/registrations/new"
    # end
  end
end
