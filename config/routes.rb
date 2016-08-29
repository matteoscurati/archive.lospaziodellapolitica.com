Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :articles, only: [:index, :show, :destroy]
  resources :authors, only: [:index, :destroy]
  resources :documents, only: [:index, :destroy]
  resources :authors do
    member do
      get :articles
    end
  end
  root 'welcome#index'
end
