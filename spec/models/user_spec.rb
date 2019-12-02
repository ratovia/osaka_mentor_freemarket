require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = create(:user)
    @google_user = create(:user, :google_user)
    @google_user_build = build(:user, :google_user_build)
  end
  describe 'valid' do
    it 'パスワードとメール指定のみで登録できること' do
      expect(@user).to be_valid
    end
  end
  describe 'invalid' do
    describe :email do
      it '重複して登録できないこと' do
        duplicate_user = build(:user, email: @user.email)
        expect(duplicate_user).to be_invalid
      end
      it '空データで登録できないこと' do
        user = build(:user,email: nil)
        expect(user).to be_invalid
      end
      it 'メールアドレスの形式でないと登録できないこと' do
        user = build(:user,email: "hello")
        expect(user).to be_invalid
      end
    end
    describe :password do
      it '5文字以下で登録できないこと' do
        user = build(:user,password: "Passw",password_confirmation: "Passw")
        expect(user).to be_invalid
      end
      it '空データで登録できないこと' do
        user = build(:user,password: "")
        expect(user).to be_invalid
      end
      it '再確認が一致しないと登録できないこと' do
        user = build(:user,password: "Password",password_confirmation: "Password2")
        expect(user).to be_invalid
      end
    end
  end

  describe 'method', sns: true do
    describe 'class method #from_omniauth' do
      it "引数のemailをもつユーザが存在していたらそのユーザを返すこと" do
        # google@test.comを検索し、すでにcreate済みなので同じユーザを返す
        google_user = User.from_omniauth(google_mock) 
        expect(@google_user.id).to eq google_user.id
      end      
      it "引数のemailをもつユーザが存在しなかったら新規にユーザを作成すること" do
        # google-build@test.comを検索し、いないので新規作成する。
        google_build_user = User.from_omniauth(google_build_mock)
        expect(@google_user_build.email).to eq google_build_user.email
      end      
    end
  end
end