require 'nokogiri'
require 'open-uri'
module Myscraping
 def self.load_url_data(url, pattern, &block)
   charset = nil
   html = open(url) do |f|
     charset = f.charset
     f.read
   end
   doc = Nokogiri::HTML.parse(html, nil, charset)
   doc.css(pattern).each do |node|
     block.call(node)
   end
 end
end

Myscraping.load_url_data('https://qiita.com/search?q=ruby', '.searchResult') do |node|
 title = node.css('.searchResult_itemTitle a').inner_html
 p "INSERT INTO scraping_titles (title) VALUES ('#{title}');"
end

# スタバのページをスクレイピング
Myscraping.load_url_data('https://www.starbucks.co.jp/beans/', '.recommend') do |node|
 product_name = node.css('.productName').inner_html
 p "#{product_name}"
end
