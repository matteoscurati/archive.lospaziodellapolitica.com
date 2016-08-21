Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles, only: [:index, :show]
  resources :authors, only: [:index]
  root 'welcome#index'
end
