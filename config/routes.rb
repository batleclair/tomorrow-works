Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: "pages#dashboard"
  get 'profile', to: "pages#profile"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :nonprofits, only: %i[index show new create edit update] do
    resources :offers, only: %i[my_offers]
    get 'my_offers', to: 'offers#my_offers'
  end
  resources :candidates
  resources :offers, only: %i[index new show create] do
    resources :candidatures, only: %i[new create]
  end
  resources :companies, only: %i[show new create edit update]
end
