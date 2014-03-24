require 'refinerycms-core'

module Refinery
  autoload :Wine100WinesGenerator, 'generators/refinery/wine100_wines_generator'

  module Wine100Wines
    require 'refinery/wine100_wines/engine'

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
