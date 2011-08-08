::Refinery::Application.routes.draw do
  resources :employees, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :employees, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
