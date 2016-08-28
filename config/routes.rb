Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :articles, only: [:index, :show, :destroy, :edit]
  resources :authors, only: [:index]
  resources :documents, only: [:index]
  resources :authors do
    member do
      get :articles
    end
  end
  root 'welcome#index'
end
