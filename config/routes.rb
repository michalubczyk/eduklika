Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'courses#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end

  resource :home

  resources :groups do
    resources :users
  end

  resources :courses do
    resources :posts do
      resources :resumes
    end
  end

  resources :courses do
    resources :groups do
      resource :enrollments
    end
  end

end
