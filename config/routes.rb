Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  patch '/courses/users_update/:id/', to: 'courses#users_update'
  patch '/courses/admin_cancel/:id/', to: 'courses#admin_cancel'
  resources :roles_types, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :register_types, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :courses_types, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :locations, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :courses, except: [ :destroy ] do
    resources :courses_teachers, only: [ :new, :create, :edit, :update ]
    resources :courses_dealers, only: [ :new, :create, :edit, :update ]
    resources :courses_participants, only: [ :new, :create, :edit, :update ]
    resources :courses_registers, only: [ :new, :create, :edit, :update ]
  end
  resources :courses_teachers, only: :destroy
  resources :courses_dealers, only: :destroy
  resources :courses_participants, only: :destroy
  resources :courses_registers, only: :destroy
end
