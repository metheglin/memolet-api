Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :v1, defaults: { format: "json" } do
    resources :memo_pads, only: [:index, :create]
    resources :memos
  end
end