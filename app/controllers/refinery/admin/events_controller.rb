module Refinery
  module Admin
    class EventsController < ::Refinery::AdminController

      before_filter :find_categories, :except => :index
  
      crudify :'refinery/event',
              :title_attribute => :title,
              :order => 'published_at DESC',
              :redirect_to_url => "main_app.refinery_admin_blog_posts_path",
              :xhr_paging => true
  
      def index
        search_all_events if searching?
  
        @archived = Event.archive
        @upcoming = Event.upcoming
        @current  = Event.current
  
        @events = (@archived | @upcoming | @current)
  
        render :partial => 'events' if request.xhr?
      end
      
      protected
      
      def find_categories
        @event_categories = EventCategory.all
      end
  
    end
  end
end