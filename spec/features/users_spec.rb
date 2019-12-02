require "rails_helper"

describe "SNSFeature", sns: true do
  describe "Google認証" do
    before do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config['omniauth.auth'] = google_mock
      visit new_user_path
    end
    
    it "「Googleで登録」を押すと適切な登録画面が表示される" do
      click_link "Googleで登録"
      expect(page).to have_content '会員情報入力'
      # nickname及びemailは入力済みになる
      expect(find_field(id: 'user_nickname').value).not_to eq ""
      expect(find_field(id: 'user_email').value).not_to eq ""
      # パスワード入力欄は表示されなくなる
      expect(page).not_to have_content 'パスワード'
    end
  end
end