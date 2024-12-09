Rails.application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  root 'static_pages#top'
  resources :users, only: %i[new create destroy edit]
  resources :boards, only: %i[index new create show edit destroy update] do
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
  get "/board/hashtag/:name", to: "boards#hashtag"
end
