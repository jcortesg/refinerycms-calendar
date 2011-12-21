Rails.application.routes.draw do
  scope(:module => 'refinery') do
    resources :events, :only => [:index, :show] do
      get 'archive/:year(/:month)' => 'events#archive', :as => 'archive',  :on => :collection
      get 'category/:id' => 'event_categories#show',    :as => 'category', :on => :collection
    end

    scope(:path => 'refinery', :as => 'refinery_admin', :module => 'admin') do
      resources :events, :except => :show
      resources :event_categories,  :except => :show
    end
  end
end
