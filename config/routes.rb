Rails.application.routes.draw do
  get "maps/index"
  resource :password_resets, only: %i[create edit update]
  resource :profile, only: %i[show edit update]
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :users, only: %i[new create destroy edit]
  resources :boards, only: %i[index new create show edit destroy update] do
    collection do
      get :bookmarks
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root "static_pages#board_top"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/board/hashtag/:name", to: "boards#hashtag"
  get "index_top", to: "static_pages#index_top"
end