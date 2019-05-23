Rails.application.routes.draw do
  resources :doses, only: %i[index show destroy]
  resources :cocktails do
    resources :doses, only: %i[new create edit update]
  end
end
