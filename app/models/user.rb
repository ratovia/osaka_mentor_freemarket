class User < ApplicationRecord
  ### mercari-study-step4
  ### add omniauth method to devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, uniqueness: true

  has_many :credits
  has_many :buy_histories
  has_many :items

  ### mercari-study-7
  ### add create user from omniauth
  ### omniauthから取得した認証情報でユーザを作成する。
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    password = Devise.friendly_token[0,20]
    unless user
        user = User.new(nickname: data['name'],
          email: data['email'],
          # password: Devise.friendly_token[0,20]
          password: password,
          password_confirmation: password
        )
    end
    user
  end
end
