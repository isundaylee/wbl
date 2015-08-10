class CalendarController < ApplicationController

  include ActionView::Helpers::UrlHelper

  SOURCE = "https://www.google.com/calendar/embed?src=81ur66f3bvpnmkkora9mcm8gjo%40group.calendar.google.com&ctz=America/Los_Angeles"

  CSS_FILES = [
    'http://fonts.googleapis.com/css?family=Roboto:400,100,300',
    'http://fonts.googleapis.com/css?family=Open+Sans:400,600,700',
    'http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400',
    'http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css',
    '/calendar_styles.css'
  ]

  JS_FILES = [
    'https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js',
    '/calendar_tweaks.js'
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

    JS_FILES.each do |j|
      js_node = Nokogiri::XML::Node.new('script', page)
      js_node['src'] = j

      page.at_css('head').last_element_child.after(js_node)
    end

    render inline: page.to_s
  end

  def show
    @nav_path = '/events/calendar'
  end

end