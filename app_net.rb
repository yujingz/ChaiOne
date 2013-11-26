require "httparty"
require 'nokogiri'

response = HTTParty.get('https://alpha.app.net/global/')

doc = Nokogiri::HTML(response.body)

usernames = []
messages = []

doc.css('.post-container').each { |link| messages << link.content }
doc.css('.username').each { |link| usernames << link.content }

(0..usernames.size-1).each do |index|
	p "Username: #{usernames[index]}"
	p "Messages: #{messages[index]}"
	p "============================"
end
