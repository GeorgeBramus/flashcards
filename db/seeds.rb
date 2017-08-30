# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'

url = 'http://1000mostcommonwords.com/1000-most-common-russian-words/'
html = open(url)

words = Nokogiri::HTML(html)
words.css('table tbody tr').each do |word|
  original_text = word.css('td')[1].text
  translated_text = word.css('td')[2].text

  Card.create(original_text: original_text, translated_text: translated_text)
end
