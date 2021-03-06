require 'refinerycms-core'

module Refinery
  autoload :CalendarGenerator, 'generators/refinery/calendar_generator'

  module Calendar
    require 'refinery/calendar/engine' if defined?(Rails)

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
