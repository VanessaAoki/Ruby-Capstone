#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'

def fetch_terms
  puts "That's an invalid output, try again." while input.empty?
  input.each do |term|
    if term == input.last
      website += term
    else
      website = "#{website}#{term}+"
    end
  end
end

browser = Watir::Browser.new
browser.goto(website)
nokogiri = Nokogiri::HTML.parse(browser.html)

title = nokogiri.css('h1#firstHeading').text
content = nokogiri.css('div.mw-parser-output > p').text

browser.quit

puts title, content
