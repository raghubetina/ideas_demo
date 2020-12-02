Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "things#index"
  resources :things
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
