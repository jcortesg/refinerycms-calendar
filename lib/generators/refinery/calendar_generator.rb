module Refinery
  class CalendarGenerator < Rails::Generators::Base
    def rake_db
      rake("refinery_calendar:install:migrations")
    end
  end
end
