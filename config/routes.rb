Rails.application.routes.draw do
  resources :tests
  # resources :questions
  # resources :ansers
  # resources :home
  devise_for :users
   resources :home#, :views => 'devise'
#   namespace :home do
#     resources :users
#     resources :home
# end

 namespace :api do
   devise_for :users, :controllers => { sessions: "api/auth"}
  end
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
