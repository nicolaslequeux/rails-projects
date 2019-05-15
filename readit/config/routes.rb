Rails.application.routes.draw do

  root "stories#index"

  resource :session

  resources :stories do
    resources :votes
  end

  get 'votes/create'
  get 'stories/index'

end
