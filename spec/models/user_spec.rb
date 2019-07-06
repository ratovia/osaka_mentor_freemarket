require 'rails_helper'

describe "User" do
  before do 
    @user = create(:user)
  end
  describe 'valid' do
    it 'パスワードとメール指定のみで登録できること' do
      expect(@user).to be_valid
    end
  end
  describe 'invalid' do
    describe :email do
      it '重複して登録できないこと' do
        duplicate_user2 = User.new(
          email: 'test_case@test.local',
          password: 'testcase'
        )
        expect(duplicate_user2).to be_invalid
      end
      it '空データで登録できないこと' do
        user = User.new(
          email: nil,
          password: 'testcase'
        )
        expect(user).to be_invalid
      end
    end
    describe :password do
      it '5文字以下で登録できないこと' do
        user = User.new(
          email: 'test_case@test.local',
          password: 'test'
        )
        expect(user).to be_invalid
      end
      it '空データで登録できないこと' do
        user = User.new(
          email: 'test_case@test.local',
          password: nil
        )
        expect(user).to be_invalid
      end
    end
  end
end