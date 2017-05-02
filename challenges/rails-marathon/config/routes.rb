Rails.application.routes.draw do
  root "galleries#index"
  resources :galleries, only: [:index, :new, :create, :show] do
    resources :paintings, only: [:new, :create, :index]
  end
end
