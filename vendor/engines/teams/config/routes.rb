::Refinery::Application.routes.draw do
  resources :teams, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :teams, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :coaches, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :coaches, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
