#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'watir'
require 'webdrivers'
require_relative '../lib/display'



display = Display.new
display.select_main

input = gets.chomp.split(' ')

if input = 1

elsif input = 2

elsif input = 3

elsif input = 4

else 
  display.invalid_main
end