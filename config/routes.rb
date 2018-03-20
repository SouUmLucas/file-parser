Rails.application.routes.draw do
  root 'sellings#index'

  resources :sellings
end
