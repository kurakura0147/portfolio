Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'contents#index'
  resources :contents, only: %i(index show new create edit update destroy) do

    collection do
      get :mypage
      get :search
    end

    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end

  resources :likes, only: %i(show)
  resources :users, only: %i(index show)

end
