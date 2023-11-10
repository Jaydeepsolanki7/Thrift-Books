Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root "categories#index"
  resources :categories do
    resources :books do
      resources :reviews, only: [:new, :create] do  
      end
    end
  end
  resources :orders, only: [:index, :show, :new, :create] do
    member do
      post 'add_to_cart/:book_id', to: 'orders#add_to_cart', as: 'add_to_cart'
    end
  end

  resources :book_orders, only: [:create, :destroy]

  get '/search_books', to: 'books#search', as: 'search_books'
  get "order/success", to: "order#success"
end

