Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index' => 'welcome#index'
  get 'welcome/mypage' => 'welcome#mypage'
  get 'welcome/new' => 'welcome#new'
end
