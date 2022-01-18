Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :competitions do
  resources :competitions, only: [:index, :show]
  resources :teams, only: [:post, :new]
end
end
