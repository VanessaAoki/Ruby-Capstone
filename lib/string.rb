#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

class String
  def clean
    chomp.strip.downcase
  end

  def remove_definite_article
    sub('the', '')
  end

  def search_term_arr
    clean.split(' ')
  end
end
