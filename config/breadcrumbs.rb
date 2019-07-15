crumb :root do
  link "メルカリ", root_path
end

crumb :user do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :logout do
  link "ログアウト"
  parent :user
end

crumb :credit do
  link "支払い方法"
  parent :user
end

crumb :person_registration do
  link "本人確認情報"
  parent :user
end

crumb :profile do
  link "プロフィール"
  parent :user
end