Rails.application.routes.draw do

  resources :stories do
    resources :votes
  end

  get 'votes/create'
  get 'stories/index'

end
