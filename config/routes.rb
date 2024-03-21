Rails.application.routes.draw do
  devise_for :users
  resources :blog_posts
  get 'my_posts', to: 'blog_posts#my_posts'
  root 'home#landing'
  get "up" => "rails/health#show", as: :rails_health_check
end
