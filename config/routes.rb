Rails.application.routes.draw do
  resources :business_cards
  devise_for :users
  root 'business_cards#index'

  post 'twilio_sms/notify', to: 'twilio_sms#notify'
end
