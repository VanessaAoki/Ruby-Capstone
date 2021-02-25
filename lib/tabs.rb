document = Nokogiri::HTML.parse(open('https://www.guitartabs.cc/tabs/e/eagles/hotel_california_tab.html'))

tabs = document.xpath("//pre").text

puts tabs