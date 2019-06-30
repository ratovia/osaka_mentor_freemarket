Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index' => 'welcome#index'
  get 'welcome/mypage' => 'welcome#mypage'
  get 'welcome/new' => 'welcome#new'
  get 'welcome/new2' => 'welcome#new2'
  get 'welcome/identification' => 'welcome#identification'
  get 'welcome/logout' => 'welcome#logout'
end
