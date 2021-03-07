#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative './lib/display'

@display = Display.new
@website = 'https://en.wikipedia.org/wiki/'

def fetch_terms(input)
  @display.request_terms
  @input = gets.chomp.split(' ')
end

def search_web(input)
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
end

def print_first
  p1 = @nokogiri.xpath("//div//p[position()=2]").text
  p2 = @nokogiri.xpath("//div//p[position()=3]").text
  puts p1, p2
end

def keep_printing(input)
  @display.continue_article
  input = gets.chomp.capitalize!
  if input == 'Y'
    px = @nokogiri.xpath("//div//p[position()=4]").text
    puts px
    keep_printing(input)
  elsif input == 'N'
    @display.again
    fetch_next(input)
  else
    @display.invalid_continue
    keep_printing(input)
  end
end

def fetch_next(input)
  input = gets.chomp
  if input == '1'
    fetch_terms(input)
  elsif input == '2'
    
  elsif input == '3'
    @display.goodbye
  else
    @display.invalid_again
    fetch_next(input)
  end
end

fetch_terms(@input)
search_web(@input)
browser_new
print_first
keep_printing(@input)
@browser.quit