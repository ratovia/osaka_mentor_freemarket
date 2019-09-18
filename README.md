Set environment credentials

1. rm config/credentials.yml.enc
2. EDITOR="vim" rails credentials:edit
3. add below data to credentials

```
secret_key_base: 
MERUCARI_PAYJP_SECRET_KEY:
BASIC_AUTH_PASSWORD:
BASIC_AUTH_USER: 
GOOGLE_CLIENT_ID: xxxxxxxxxxxxxxxxxxx
GOOGLE_CLIENT_SECRET: xxxxxxxxxxxxxxxx
FACEBOOK_KEY: 
FACEBOOK_SECRET: 
RECAPTURE_SITE_KEY: 
```