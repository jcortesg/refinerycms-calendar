require 'refinerycms-calendar'

module Refinery
  module Calendar
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_calendar

      initializer "register refinery_calendar plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinery_calendar"
          plugin.url = app.routes.url_helpers.refinery_admin_events_path
          plugin.menu_match = /^\/refinery\/events$/
          plugin.activity = {
            :class_name => :'refinery/event',
            :title => 'name',
            :url_prefix => nil
          }
        end

        # Refinery::Plugin.register do |plugin|
          # plugin.pathname = root
          # plugin.name = "refinery_calendar"
          # plugin.url = app.routes.url_helpers.refinery_admin_events_path
          # plugin.menu_match = %r{refinery/even(ts|t_categories|t_settings)(/.+?)?$}
          # plugin.activity = [{
              # :class_name => :'refinery/event',
              # :title => 'name',
              # :url_prefix => nil,
              # :url => 'refinery_admin_events_path'
            # },{ 
              # :class_name=>:'refinery/event_category',
              # :title => 'name',
              # :url_prefix => nil,
              # :url => 'refinery_admin_event_categories_path' 
            # },
          # ]
        # end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Calendar)
      end
    end
  end
end
