Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "courses#index"
  get 'pages/home', to: "pages#home"
  patch '/courses/users_update/:id/', to: 'courses#users_update'
  get 'courses/no_sessions', to: 'courses#no_sessions'
  resources :roles_types, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :register_types, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :courses_types, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :locations, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :courses, except: [ :destroy ] do
    resources :courses_area_managers, only: [ :index, :new, :create, :edit, :update ]
    resources :courses_teachers, only: [ :index, :new, :create, :edit, :update ]
    resources :courses_dealers, only: [ :index, :new, :create, :edit, :update ]
    resources :courses_participants, only: [ :index, :new, :create, :edit, :update ]
    resources :courses_registers, only: [ :index, :new, :create, :edit, :update ]
    resources :courses_sessions, only: [ :new, :create, :edit, :update, :destroy ]
  end
  resources :courses_area_managers, only: :destroy
  resources :courses_teachers, only: :destroy
  resources :courses_dealers, only: :destroy
  resources :courses_participants, only: :destroy
  resources :courses_registers, only: :destroy
end
