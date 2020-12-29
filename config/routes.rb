Rails.application.routes.draw do
  resources :books

  devise_for :users
  devise_scope :user do
    root :to => 'books#index'
  end
end
