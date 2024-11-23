Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, path: 'auth',
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       password: 'secret',
                       confirmation: 'verification',
                       unlock: 'unblock',
                       registration: 'register',
                       sign_up: 'cmon_let_me_in'
                     }

  resources :reservations

  namespace :admin do
    resources :users
    resources :tables
    resources :dashboards
    resources :reservations do
      put 'feedback', on: :member
    end
  end
end
