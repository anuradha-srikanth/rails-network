Rails.application.routes.draw do
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

    get 'home' => 'home#home', as: :home
    get "add_friend" => 'home#add_friend', as: :add_friend 

end
