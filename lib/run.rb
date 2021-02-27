require 'nokogiri'
require 'open-uri'
require_relative '../lib/website'
require_relative '../lib/display'

class Run
  include Display
  attr_accessor :current_page, :active
  def initialize
    @current_page = nil
    @active = true
  end
end