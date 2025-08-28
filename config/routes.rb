Rails.application.routes.draw do
  root "static_pages#home"
  get "shuffle", to: "static_pages#shuffle"

  resources :posts, only: [ :index, :create ]
end
