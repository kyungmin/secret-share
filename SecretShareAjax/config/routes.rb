SecretShareAjax::Application.routes.draw do
  root :to => "users#show"

  resources :secrets, :only => [:create]
  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, :only => [:new]
    resource :friendship, :only => [:create, :destroy]
    resources :friendships, :only => [:index]
  end
  resource :session, :only => [:create, :destroy, :new]

  get '/error' => 'users#error'
end
