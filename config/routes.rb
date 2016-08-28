Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles, only: [:index, :show]
  resources :authors, only: [:index]
  resources :documents, only: [:index]
  resources :authors do
    member do
      get :articles
    end
  end
  root 'welcome#index'
end
