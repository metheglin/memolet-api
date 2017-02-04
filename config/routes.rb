Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :v1, defaults: { format: "json" } do
    resources :memos, only: [:index, :create]
  end
end
