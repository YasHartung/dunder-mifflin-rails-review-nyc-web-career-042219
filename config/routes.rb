Rails.application.routes.draw do
  
  get "/", to: "application#welcome"
  get "dogs/sort", to: "dogs#sort_dogs"


  resources :dogs
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
