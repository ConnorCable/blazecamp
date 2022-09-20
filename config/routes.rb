Rails.application.routes.draw do
  resources :projects
  devise_for :users, controllers: {registrations: "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end

 get '/pages/admin', to: "pages#index"
 post '/pages/admin', to: "pages#toggle_admin"
 delete '/pages/admin', to: "pages#destroy", :as => :user

end
