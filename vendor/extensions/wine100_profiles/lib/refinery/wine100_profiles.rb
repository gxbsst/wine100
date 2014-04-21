require 'refinerycms-core'

module Refinery
  autoload :Wine100ProfilesGenerator, 'generators/refinery/wine100_profiles_generator'

  module Wine100Profiles
    require 'refinery/wine100_profiles/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
