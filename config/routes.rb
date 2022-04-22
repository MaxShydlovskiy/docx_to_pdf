Rails.application.routes.draw do
  resources :conversions, only: [:index, :new, :create, :destroy]
  root "conversions#index"
end
