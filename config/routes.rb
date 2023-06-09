Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'registries#index', as: :home
  resources :registries
  resources :participants
  resources :coordinators do
    patch :enroll, on: :member
    get   :enroll, on: :member
    get   :export, on: :collection
  end
end
