#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative '../lib/display'
require_relative '../lib/search'

class Firstpage
  def new_firstpage
    @firstpage = 'https://en.wikipedia.org/wiki/Main_Page'
    @display = Display.new
    @search = Search.new
    @display.select_main
    @input = gets.chomp
    browser_new
    fetch_first(@input)
    @search.fetch_next(@input)
    @browser.quit
  end

  def browser_new
    @browser = Watir::Browser.new
    @browser.goto(@firstpage)
    @nokogiri = Nokogiri::HTML.parse(@browser.html)
  end
  
  def fetch_first(input)
    case @input
    when '1'
      title = @nokogiri.css('h2#mp-tfa-h2 > span.mw-headline').text
      content = @nokogiri.css('div#mp-tfa > p').text
      puts title, "\n", content
    when '2'
      title = @nokogiri.css('h2#mp-itn-h2 > span.mw-headline').text
      content = @nokogiri.css('div#mp-itn > ul').text
      puts title, "\n", content
    when '3'
      title = @nokogiri.css('h2#mp-dyk-h2 > span.mw-headline').text
      content = @nokogiri.css('div#mp-dyk > ul').text
      puts title, "\n", content
    when '4'
      title = @nokogiri.css('h2#mp-otd-h2 > span.mw-headline').text
      content = @nokogiri.css('div#mp-otd > p').text
      puts title, "\n", content
    else
      @display.invalid_main
    end
  end
end