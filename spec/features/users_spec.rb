require "rails_helper"

describe "UserFeature" do

  describe "Google認証" do

    before do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config['omniauth.auth'] = google_mock
      visit new_user_path
    end
    
    it "「Googleで登録」を押すと登録画面に行ける。" do
      click_link "Googleで登録"
      expect(page).to have_content '会員情報入力'
    end

    it "「Googleで登録」を押すとニックネームはすでに表示されている" do
      click_link "Googleで登録"
      expect(find_field(id: 'user_nickname').value).not_to eq ""
    end

    it "「Googleで登録」を押すとメールアドレスはすでに表示されている" do
      click_link "Googleで登録"
      expect(find_field(id: 'user_email').value).not_to eq ""
    end
    
    it "「Googleで登録」を押すとパスワードの入力欄が表示されないようになっている" do
      click_link "Googleで登録"
      expect(page).not_to have_content 'パスワード'
    end
  end
end