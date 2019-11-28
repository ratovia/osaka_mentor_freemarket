module OmniauthMacros
  def google_mock
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        provider: 'google',
        uid: '12345',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        },
        credentials: {
          token: 'hogefuga'
        }
      }
    )
  end
end