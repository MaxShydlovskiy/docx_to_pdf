Rails.application.routes.draw do
  resources :conversions, only: [:index, :new, :create, :edit, :update, :destroy]
  root "conversions#index"
end
