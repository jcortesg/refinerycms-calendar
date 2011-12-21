module Refinery
  module Admin
    class EventCategoriesController < ::Refinery::AdminController

      crudify :'refinery/event_category',
              :title_attribute => :name,
              :xhr_paging => true
  
    end
  end
end