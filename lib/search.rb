#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative './lib/display'

@display = Display.new

puts 'Type the terms of your search: '
@input = gets.chomp.split(' ')
@website = 'https://en.wikipedia.org/wiki/'


def search_web(input)
  input.each do |term|
    if term == input.last
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
end


def print_first
  p1 =  @nokogiri.xpath("//div//p[position()=2]").text
  p2 =  @nokogiri.xpath("//div//p[position()=3]").text
  puts p1, p2, @display.continue_article
end
def keep_printing
  
end

search_web(@input)
browser_new
print_first
@browser.quit

