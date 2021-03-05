#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative './lib/display'

display = Display.new


puts "Type the terms of your search: "
input = gets.chomp.capitalize!.split(' ')
@website = 'https://en.wikipedia.org/wiki/'


while input.empty?
  display.invalid_article
end

input.each do |term|
  if term != input.last
    @website = @website + term + '+'
  else
    @website += term
  end
end

def browser_new
  @browser = Watir::Browser.new
  @browser.goto(@website)
  @nokogiri = Nokogiri::HTML.parse(@browser.html)
end

browser_new

title = @nokogiri.css("h1#firstHeading").text
content = @nokogiri.css("div.mw-parser-output > p").text

@browser.quit

puts title, content