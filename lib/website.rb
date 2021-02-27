require 'nokogiri'
require 'open-uri'
require_relative '../lib/tabs'

class Website
  def initialize(website)
    @website = siteurl(website)
    @nokogiri = NokogiriNokogiri::HTML(URI.open(@website))
  end
  
end