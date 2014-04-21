module Refinery
  module Wine100Profiles
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Wine100Profiles

      engine_name :refinery_wine100_profiles

      initializer "register refinerycms_wine100_profiles plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "wine100_profiles"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.wine100_profiles_admin_wine100_profiles_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/wine100_profiles/wine100_profile',
            :title => 'company_name_en'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Wine100Profiles)
      end
    end
  end
end
