Rails.application.routes.draw do
 
  mount RailsAdmin::Engine => '/anjali2679', as: 'rails_admin'
    # devise_for :users
      root 'pages#home'
       get 'index' => 'pages#index'
       get 'home' => 'pages#home'
       post 'home' => 'pages#home'
        get 'explore' => 'pages#explore'
        get 'leaderboard' => 'pages#leaderboard'
        get 'victory' => 'pages#victory'
        get 'loginsignup' => 'sessions#loginsignup'
      # get '/user/:id' => 'pages#profile'
      get 'users' =>'pages#profile'
      post 'users' => 'pages#home'
        get 'edit' =>'pages#edit'
        get 'update' => 'pages#update'
        get 'auth/:provider/callback', to: "sessions#create"
        delete 'sign_out', to:  "sessions#destroy", as: 'sign_out'
        

       
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages,:sessions,:users
end