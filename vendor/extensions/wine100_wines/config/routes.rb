Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :wine100_wines do
    resources :wine100_wines, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :wine100_wines, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :wine100_wines, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
