Rails.application.routes.draw do

  root "stories#index"

  resource :session

  resources :stories do
    collection do
      get "bin"
    end
    resources :votes
  end

  get 'votes/create'
  get 'stories/index'

end
