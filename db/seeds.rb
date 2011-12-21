::Refinery::User.all.each do |user|
  if user.plugins.where(:name => 'refinery_calendar').blank?
    user.plugins.create(:name => 'refinery_calendar',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end if defined?(Refinery::User)


if defined?(Refinery::Page)
  events_page = Refinery::Page.create(
    :title => 'Events',
    :link_url => '/events',
    :deletable => false,
    :position => ((Refinery::Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
    :menu_match => '^/events(\/|\/.+?|)$'
  )

  Refinery::Pages.config.default_parts.each do |default_page_part|
    events_page.parts.create(:title => default_page_part, :body => nil)
  end
end
