Rails.application.routes.draw do
  devise_for :users
  resources :blog_posts
  get 'my_posts', to: 'blog_posts#my_posts'
  get 'index', to: 'admin#index'
  get 'all_posts/:user_id', to: 'admin#all_posts', as: 'all_posts'
  delete 'destroy_post/:id', to: 'admin#destroy_post', as: 'destroy_post'  # Define the route for destroy_post
  root 'home#landing'
  get "up" => "rails/health#show", as: :rails_health_check
end
