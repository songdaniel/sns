Rails.application.routes.draw do
  get 'chats/show'

  devise_for :users
  root 'posts#index'
  resources :posts, except: [:show] do
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  end
  resources :follows, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process mount ActionCable.server => '/cable'
  mount ActionCable.server => '/cable'
end
