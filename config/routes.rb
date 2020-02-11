Rails.application.routes.draw do
  resources :bugs
  root to: 'pages#home'
  devise_for :users, controllers: # becuase we have customized them
    {
      :sessions => "users/sessions" , 
      :registrations => "users/registrations"
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
