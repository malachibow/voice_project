Rails.application.routes.draw do

  root "pages#home"
  resources :pages

  get 'topics/list', to: 'topics#list'
  resources :topics

  put 'replies/unproductive/:id', to: 'replies#unproductive'
  put 'replies/agree/:id', to: 'replies#agree'
  put 'replies/disagree/:id', to: 'replies#disagree'
  resources :replies

  get 'my_posts', to: 'posts#my_posts', as: 'my_posts'
  get 'saved', to: 'posts#saved', as: 'saved'
  post 'save/:id', to: 'posts#save', as: 'save'
  post 'follow/:id', to: 'posts#follow', as: 'follow'
  resources :posts
 
  resources :saves

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
