# !/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative '../lib/display'

class Search
  def new_search
    @display = Display.new
    input = nil
    @website = 'https://en.wikipedia.org/wiki/'
    fetch_terms(input)
    browser_new
    print_first
    keep_printing(input)
    @browser.quit
  end

  def fetch_terms(input)
    @display.request_terms
    @input = gets.chomp.split
    if @input.empty?
      @display.invalid_terms
      fetch_terms(input)
    else
      search_web(input)
    end
  end

  def search_web(_input)
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
    p1 = @nokogiri.xpath('//div//p[position()=2]').text
    p2 = @nokogiri.xpath('//div//p[position()=3]').text
    puts p1, p2
  end

  def keep_printing(input)
    @display.continue_article
    @input = gets.chomp.capitalize!
    case @input
    when 'Y'
      px = @nokogiri.css('div.mw-parser-output > p').text
      puts px
      fetch_next(input)
    when 'N'
      fetch_next(input)
    else
      @display.invalid_continue
      keep_printing(input)
    end
  end

  def fetch_next(input)
    @display.fetch_again
    @input = gets.chomp
    case @input
    when '1'
      new_search
    when '2'
      @display.goodbye
    else
      @display.invalid_again
      fetch_next(input)
    end
  end
end
