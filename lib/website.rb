#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'

class Website
  attr_reader :nokogiri, :links
  attr_accessor :website, :page_type, :content

  def initialize(website)
    @website = siteurl(website)
    @nokogiri = Nokogiri::HTML(URI.open(@website))
    @page_type = nil
    @content = nil
    @links = {}
    what_page_type
    fetch_page_content
    fetch_links
  end

  private

  def siteurl(address)
    return address if address.include?('https://')

    address.gsub('../', 'https://en.wikipedia.org/') if address.start_with?('../')
  end

  def what_page_type
    Website::TYPES.each do |type, hooks|
      prefix = website.include?(hooks[:prefix])
      title = nokogiri.title.include?(hooks[:title_hook])
      next unless prefix && title

      @page_type = type
    end
  end

  def fetch_links
    case page_type
    when :section
      content.each do |_key, value_arr|
        value_arr.each { |element| @links[element.text] = element['href'] }
      end
    when :search
      content do |x|
        @links[x.text] = e['href'] unless links.lenght >= 5
      end
    end
  end

  def fetch_article
    @content = {}
    @content[:article_title] = fetch_article_title
    @content[:article_text] = fetch_article_text
  end

  def fetch_page_content
    fetch_article_content if page_type == :article
    fetch_section_content if page_type == :section
    fetch_search_content if page_type == :search
  end

  def fetch_article_content
    article_string = @nokogiri.css('div.mw-parser-output > p').text
    article_array = article_string
    article_array.map! { |string| string.split("\n") }
    article_array.inject { |x, array| x.push("\n").concat(array) }
  end

  def fetch_section_content
    @content = {}
    current_section = nil
    nokogiri.css('div.mw-parser-output').each do |e|
      case e['class']
      when 'headline'
        current_headline = e.css('h2 > span.mw-headline').inner_text
        content[current_headline] = []
      when 'title'
        content[current_headline].push(e.css('ul > li > a')[0])
      end
    end
  end

  def fetch_search_content
    @content = []
    search = @nokogiri.css('ul.mw-search-results')
    search.each do |results|
      heading = results.css('ul.mw-search-results > li.mw-search-result > div.mw-search-result-heading').inner_text
      article_results = results if heading.include?('may refer to:')
    end
    return if search.nil?

    search_links = article_results.css('p.mw-search-createlink')
    search_links.each { |e| content.push(e) unless content.length >= 5 }
  end

  Website::TYPES = {
    search: {
      prefix: 'https://en.wikipedia.org/w/index.php?search=',
      title_hook: ' - Search results - Wikipedia'
    },
    section: {
      prefix: 'https://en.wikipedia.org/wiki/',
      title_hook: ' - Wikipedia'
    },
    article: {
      prefix: 'https://en.wikipedia.org/wiki/',
      title_hook: ' - Wikipedia'
    }
  }.freeze
end
