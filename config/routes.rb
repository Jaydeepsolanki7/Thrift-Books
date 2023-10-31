Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users
  root "categories#index"
  resources :categories do
    resources :books do
      get 'search', on: :member
    end
  end
end
