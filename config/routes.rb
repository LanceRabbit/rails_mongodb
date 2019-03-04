Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :todo, only: [:index, :create, :edit, :update, :destroy]
      root to: "todo#index"
    end
  end
  # get 'todo/index'
  # get 'todo/create'
  # get 'todo/edit'
  # get 'todo/update'
  # get 'todo/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
