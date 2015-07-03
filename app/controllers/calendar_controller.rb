class CalendarController < ApplicationController

  include ActionView::Helpers::UrlHelper

  SOURCE = "https://www.google.com/calendar/embed?src=pdighgf028nmbjbrno8oed8vsg@group.calendar.google.com"

  CSS_FILES = [
    'http://fonts.googleapis.com/css?family=Roboto:400,100,300',
    'http://fonts.googleapis.com/css?family=Open+Sans:400,600,700',
    'http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400',
    'http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css',
    '/calendar_styles.css'
  ]

  def embed
    page = Nokogiri::HTML(open(SOURCE).read)

    CSS_FILES.each do |c|
      css_node = Nokogiri::XML::Node.new('link', page)
      css_node['rel'] = 'stylesheet'
      css_node['type'] = 'text/css'
      css_node['href'] = c

      page.at_css('head').last_element_child.after(css_node)
    end

    render inline: page.to_s
  end

  def show
  end

end