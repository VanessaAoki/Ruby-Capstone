# !/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'

class Search
  attr_reader :website
  attr_accessor :px
  def initialize(input)
    @input = input
    @input = @input.split
    @website = 'https://en.wikipedia.org/wiki/'
    
    @input.each do |term|
      if term == @input.last
        @website += term
      else
        @website = "#{@website}#{term}_"
      end
    end
  end

  def browser_new
    @browser = Watir::Browser.new
    @browser.goto(@website)
    @nokogiri = Nokogiri::HTML.parse(@browser.html)
    px = @nokogiri.css('div.mw-parser-output > p').text
    title = @nokogiri.css('h1#firstHeading').text
    puts title
  end
end
