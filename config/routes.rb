Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :employees do
  	get 'getEmployeeDetailsWithAddresses', on: :collection
  end
  resources :designations
  resources :addresstypes
  resources :addresses do
  	get 'getEmployeeAddress', on: :collection
  end
  resources :countries
  resources :states
end
