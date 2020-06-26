Rails.application.routes.draw do
  resources :contatos
 
  root :to => contatos_path
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
