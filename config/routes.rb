Rails.application.routes.draw do


  root 'welcome#index'

  #just did this for practice
  #post 'event_comments_create' => 'comments#custom_create'

  get "login" => "sessions#new"
  get "logout" => "sessions#destroy"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users

  
  resources :events do

    resources :comments do

    end

    member do
      get :download
    end
  end

  resources :images do
    resources :comments
    resources :tags

    get :autocomplete_tag_name, :on => :collection


    member do
      get :download
    end
  end

  
end
