Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/posts/:id/like', to: "posts#like", as: 'like_post'
  resources :bloggers, only: [:new, :create, :show, :index]
  resources :destinations, only: [:show, :index]
  resources :posts, only: [:new, :create, :show, :index, :edit, :update]
end
