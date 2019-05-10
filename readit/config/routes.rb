Rails.application.routes.draw do

  resource :session

  resources :stories do
    resources :votes
  end

  get 'votes/create'
  get 'stories/index'

end
