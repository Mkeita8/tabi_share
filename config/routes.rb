Rails.application.routes.draw do
  get "profiles/show"
  get "profiles/edit"
  get "profiles/update"
  root 'static_pages#top'
  resources :users, only: %i[new create destroy]
  resources :boards, only: %i[index new create show edit destroy update] do
    collection do
      get :bookmarks
    end
  end
  resources :bookmarks, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get "up" => "rails/health#show", as: :rails_health_check
end
