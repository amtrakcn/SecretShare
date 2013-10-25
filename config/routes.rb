SecretShareAjax::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, :only => [:new]
    resource :friendship, :only => [:create]
  end
  resource :session, :only => [:create, :destroy, :new]
  resources :secrets, :only => [:create]

  root :to => "users#show"
end
