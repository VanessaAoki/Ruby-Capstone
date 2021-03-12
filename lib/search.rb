# !/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'

class Search
  attr_reader :website
  attr_accessor :title
  def initialize(input, var)
    @input = input
    @website = 'https://en.wikipedia.org/wiki/'
    @var = var
        
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
    @px = @nokogiri.css(@var).text
  end
end
