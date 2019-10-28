Rails.application.routes.draw do
  root to: 'productions#index'
  resources :productions
  resources :production_kinds
end