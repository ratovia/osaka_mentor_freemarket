class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 以下omniauthを有効化する記述
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        #  :omniauthable, omniauth_providers: %i[facebook google_oauth2]
         :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, uniqueness: true

  has_many :credits
  has_many :buy_histories
  has_many :items
  #SNS認証で得られたユーザー情報を取得する
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
# binding.pry
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
      nickname: data['name'],
      email: data['email'],
      password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
