Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  root "categories#index"
  resources :categories do
    resources :books do
      get 'search', on: :member
    end
  end

  resources :checkout, only: [:new] do
    post 'create', on: :collection
    get 'success', on: :member
    get 'cancel', on: :member
  end
end
