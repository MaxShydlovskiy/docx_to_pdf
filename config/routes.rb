Rails.application.routes.draw do
  resources :conversions, only: [:index, :new, :create, :edit, :update, :destroy, :job_done, :trigger_job]
  get "conversions/job_done"
  post "conversions/trigger_job"
  root "conversions#index"
end
