class User < ApplicationRecord
  # 以下omniauthを有効化する記述
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  validates :email, uniqueness: true

  has_many :credits
  has_many :buy_histories
  has_many :items
  # SNS認証で得られたユーザー情報を取得する
  def self.from_omniauth(access_token)
    data = access_token.info
    # emailが既に登録されているか確認する
    user = User.where(email: data['email']).first
    password = Devise.friendly_token[0, 20]
    unless user
      user = User.new(
        nickname: data['name'],
        email: data['email'],
        password: password,
        password_confirmation: password
      )
    end
    user
  end
end
