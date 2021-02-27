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

  def show_content
    page = current_page
    content = page_content
    type = page.page_type
    case type
    when :search
      content.map(&:inner_text)
    when :article
      array = []
      content.each do
        array.push("\n")
        value.each { |element| arr.push(element.inner_text)}
        array.push("\n")
      end
      array
    end
  end
end