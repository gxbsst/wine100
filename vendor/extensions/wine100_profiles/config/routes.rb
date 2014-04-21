Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :wine100_profiles do
    resources :wine100_profiles, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :wine100_profiles, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :wine100_profiles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
