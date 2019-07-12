# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # モデルは次のように設定してください
  # devise :omniauthable, omniauth_providers: [:twitter]

  # このコントローラでこのようなアクションメソッドを作成する必要があります。
  # def google_oauth2
  #   callback_from :google
  # end

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    # binding.pry
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      # sign_in_and_redirect @user, event: :authentication
        redirect_to new_user_registration_path
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  
  # def passthru
  #   super
  # end
end
