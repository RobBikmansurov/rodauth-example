Rails.application.routes.draw do
  root to: "home#index"

  controller :rodauth do
    get "download-recovery-codes"
  end

  resources :posts
end
