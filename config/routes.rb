Rails.application.routes.draw do
  resources :articles do 
    post 'new_comment', on: :member
  end
  
  get "pages/:id" => "pages#index", :as => :pages
  root 'pages#index', {id: "home"}
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end