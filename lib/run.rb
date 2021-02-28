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
      content.each do |key, value|
        array.push("\n")
        value.each { |element| arr.push(element.inner_text)}
        array.push("\n")
      end
      array
    end
  end

  def input_proc(input)
    type_of_page = @current_page.page_type if @current_page

    search_terms(input) if type_of_page.nil?
    proc_path(input) if type_of_page == :article
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

  def search_page(search_terms)
    new_website = Website::TYPES[:search][:prefix]
    new_website += search_terms
    change_page(new_website)
  end

  def search_terms(input)
    search_page(input.search_term_arr)
  end

  def article_selection(input)
    next_link(input)
  end

  def next?(input)
    input = input.clean.to_i
    valid = [1, 2, 3]
    return unless valid.inlude?(input)
      case input
      when 1
        @current_page = nil
      when 2
        
      when 3
        self.active = false
    end
  end
end