#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'


puts "Type the terms of your search: "
input = gets.chomp.capitalize!.split(' ')
website = 'https://en.wikipedia.org/wiki/'



while input.empty?
  puts "That's an invalid output, try again."
end
input.each do |term|
  if term != input.last
    website = website + term + '+'
  else
    website += term
  end
end


browser = Watir::Browser.new
browser.goto(website)
nokogiri = Nokogiri::HTML.parse(browser.html)

title = nokogiri.css("h1#firstHeading").text
content = nokogiri.css("div.mw-parser-output > p").text

browser.quit

puts title, content