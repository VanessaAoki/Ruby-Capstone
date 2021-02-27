require 'nokogiri'
require 'open-uri'

class Website
  attr_reader :nokogiri, :links
  attr_accessor :website, :page_type, :content
  def initialize(website)
    @website = siteurl(website)
    @nokogiri = NokogiriNokogiri::HTML(URI.open(@website))
    @page_type = nil
    @content = nil
    @links = {}
    what_page_type
    get_page_content
    get_links
  end

  def what_page_type
    Website::TYPES.each do |type, hooks|
      prefix = website.include?(hooks[:prefix])
      title = nokogiri.title.include?(hooks[:title_hook])
      body = nokogiri.to_s.include?(hooks[:body_hook])
      next unless prefix && title && body
      @page_type = type
    end
  end

  def get_links
    if page_type == :article
      content.each do |key, arr|
        arr.each {|element| @links[element.text] = element['href']}
      end
    elsif page_type == :search
      content do |x|
        @links[x.text] = e['href'] unless links.lenght >= 5
      end
    end
  end

  def get_article
    @content = {}
    @content[:article_title] = get_article_title
    @content[:article_text] = get_article_text
  end

  def get_page_content
    get_article_content if page_type == :article
    get_search_content if page_type == :search
  end

  def get_article_content
    article_string = @nokogiri.css('div.mw-parser-output > p').text
    article_array = article_string
    article_array.map! { |string| string.split("\n")}
    article_array.inject {|x, array| x.push("\n").concat(array)}
  end

  def get_search_content
    @content = []
    search = @nokogiri.css('ul.mw-search-results')
    search.each do |results|
      heading = search.css('ul.mw-search-results > li.mw-search-result > div.mw-search-result-heading').text
    end
  end

  Website::TYPES = {
    search: {
      prefix: 'https://en.wikipedia.org/w/index.php?search=',
      title_hook: ' - Search results - Wikipedia',
    }
    article: {
      prefix: 'https://en.wikipedia.org/wiki/'
      title_hook: ' - Wikipedia'
    }
  }
end