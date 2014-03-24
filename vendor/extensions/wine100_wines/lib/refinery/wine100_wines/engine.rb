module Refinery
  module Wine100Wines
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Wine100Wines

      engine_name :refinery_wine100_wines

      initializer "register refinerycms_wine100_wines plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "wine100_wines"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.wine100_wines_admin_wine100_wines_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/wine100_wines/wine100_wine',
            :title => 'style'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Wine100Wines)
      end
    end
  end
end
