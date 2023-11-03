Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root "categories#index"
  resources :categories do
    resources :books do
    end
  end
  get '/search_books', to: 'books#search', as: 'search_books'
  post "checkout/create", to: "checkout#create"
  get "checkout/success", to: "checkout#success"
end
