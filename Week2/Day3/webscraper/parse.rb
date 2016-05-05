require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open('post.html'))

title = page.css('table .comhead a')[1].text

puts title

p page.xpath('//span[contains(text(), "u")]')

