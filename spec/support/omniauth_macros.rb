module OmniauthMacros
  def google_mock
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
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

  def omni_param
    {
      "state"=>"b709e1754fa89fb734f9d3634ae078050fffb1a2c5e1b597",
      "code"=>"4/tgHl0GEWb1GZV6kxmN80pDzwBrKp7jcWU_Di7vt7bctXUbbiwh6rY8CyRD5zuhtE6Z_Kn1mw_-aEvANHOiz_EzE",
      "scope"=>"email profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile openid",
      "authuser"=>"1",
      "session_state"=>"0c9edd96d49930cb2f0e0fbf8ff983b9b224a377..1dfb", 
      "prompt"=>"consent"
    }
  end
end