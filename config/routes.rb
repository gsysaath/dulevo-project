Rails.application.routes.draw do
  devise_for :users, skip: [:passwords], controllers: { registrations: "users/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # List of Admins
  namespace :users do
      resources :users, only: [ :edit, :destroy, :update]
  end
  get 'users', to: 'users/users#index'
  root to: "courses#index"
  patch '/courses/users_update/:id/', to: 'courses#users_update'
  get 'courses/no_sessions', to: 'courses#no_sessions'
  get 'courses/incoming', to: 'courses#incoming'
  get 'courses/finished', to: 'courses#finished'
  patch '/courses/:course_id/courses_area_manager/:id/quit', to: "courses_area_managers#quit", as: "manager_quit"
  patch '/courses/:course_id/courses_area_manager/:id/participate', to: "courses_area_managers#participate", as: "manager_participate"
  patch '/courses/:course_id/courses_dealer/:id/quit', to: "courses_dealers#quit", as: "dealer_quit"
  patch '/courses/:course_id/courses_dealer/:id/participate', to: "courses_dealers#participate", as: "dealer_participate"
  patch '/courses/:course_id/courses_teacher/:id/quit', to: "courses_teachers#quit", as: "teacher_quit"
  patch '/courses/:course_id/courses_teacher/:id/participate', to: "courses_teachers#participate", as: "teacher_participate"
  patch '/courses/:course_id/courses_participant/:id/quit', to: "courses_participants#quit", as: "participant_quit"
  patch '/courses/:course_id/courses_participant/:id/participate', to: "courses_participants#participate", as: "participant_participate"
  patch '/courses/:course_id/courses_register/:id/quit', to: "courses_registers#quit", as: "register_quit"
  patch '/courses/:course_id/courses_register/:id/participate', to: "courses_registers#participate", as: "register_participate"
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
