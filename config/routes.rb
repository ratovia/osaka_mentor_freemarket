Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index' => 'welcome#index'
  get 'welcome/mypage' => 'welcome#mypage'
  get 'welcome/useredit' => 'welcome#useredit'
  get 'welcome/new' => 'welcome#new'
  get 'welcome/new2' => 'welcome#new2'
  get 'welcome/new3' => 'welcome#new3'
  get 'welcome/new4' => 'welcome#new4'
  get 'welcome/new5' => 'welcome#new5'
  get 'welcome/new6' => 'welcome#new6'
  get 'welcome/identification' => 'welcome#identification'
end
