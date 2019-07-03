Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index' => 'welcome#index'
  get 'welcome/mypage' => 'welcome#mypage'
  get 'welcome/useredit' => 'welcome#useredit'
  get 'welcome/new' => 'welcome#new' 
  get 'welcome/registration' => 'welcome#registration'
  get 'welcome/sms' => 'welcome#sms'
  get 'welcome/address' => 'welcome#address'
  get 'welcome/payment' => 'welcome#payment'
  get 'welcome/create' => 'welcome#create'
  get 'welcome/identification' => 'welcome#identification'
  get 'welcome/new_item' => 'welcome#new_item'
end
