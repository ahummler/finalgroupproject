Rails.application.routes.draw do
  resources :business_cards
  devise_for :users
  root 'business_cards#index'
end
