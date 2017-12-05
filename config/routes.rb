Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "main#index"

  get 'doctor', to: 'doctor#index'
  get 'medical', to: 'medical#index'
  get 'charge_nurse', to: 'nurse#index'
end
