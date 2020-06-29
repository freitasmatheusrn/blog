Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles do 
    post 'new_comment', on: :member
  end
  root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end