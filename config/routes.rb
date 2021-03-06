MusicApp::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]

  resources :bands do
    resources :albums, :only => [:index, :new, :create]
  end

  resources :albums, :except => [:index, :new, :create] do
    resources :tracks, :only => [:index, :new, :create]
  end

  resources :tracks, :except => [:index, :new, :create]

end
