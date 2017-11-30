Rails.application.routes.draw do
  resources :groups
  get 'qr_codes/new'

  get 'qr_codes/create'

  resources :accounts
  resources :experiences
  resources :projects
  resources :skills
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    # resources :accounts do
    #   collection do
    #     get 'add_friend'
    #     # post 'another_create'
    #   end
    # end

  # resources :accounts do
  #   member do
  #     get :contacts
  #   end
  # end

    resources :sessions, :only => [:create, :destroy]

    get 'home' => 'home#home', as: :home
    root to: "home#home"
    
    get "new_contact" => 'accounts#new_contact', as: :new_contact
    get "contacts" => 'accounts#contacts', :as => :contacts
    get 'signup' => 'accounts#new', :as => :signup
    get 'login' => 'sessions#new', :as => :login
    get 'logout' => 'sessions#destroy', :as => :logout
    #get 'profile' => 'profiles#show', :as => :profile

    resources :qr_codes, only: [:new, :create]
    # root to: "qr_codes#new"
    get 'qr' => 'qr_codes#new', :as => :generateQR


end
