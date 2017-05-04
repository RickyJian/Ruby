Rails.application.routes.draw do
  resources :tests
  resources :users
  
  resources :candidates do
    post :vote, on: :member
  end
 ##  resources :candidates
end
