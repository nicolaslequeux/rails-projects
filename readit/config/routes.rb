Rails.application.routes.draw do

  get 'tags/show'
  get 'users/show'
  root "stories#index"

  resource :session

  resources :users

  resources :stories do
    collection do
      get "bin"
    end
    resources :votes
  end

  resources :tags

  get 'votes/create'
  get 'stories/index'

end
