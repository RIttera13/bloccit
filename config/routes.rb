Rails.application.routes.draw do

  resources :questions
  resources :posts

  get 'about' => 'welcome#about'
  get 'question' => 'questions#index'
  
  root 'welcome#index'
end
