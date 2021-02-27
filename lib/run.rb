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

  def input_proc(input)
    type_of_page = @current_page.page_type if @current_page

    proc_search_terms(input) if page_type.nil?
    proc_path(input) if page_type == :article
  end

  def link(str_input)
    input = str_input.clean
    current_page.links.each do |key, value|
      article_title = key.clean
      if input == article_title
        change_page(value)
        break
      end
    end
  end

  def change_page(website)
    @current_page = Website.new(website)
  end

end