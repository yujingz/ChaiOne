require "httparty"
require 'oj'

REPO = "rails"
OWNER = "rails"
TIME_FORMAT = "%Y-%m-%d"
INPUT_MONTHS = 6
TOP = 3

today = Date.parse(Time.new().strftime(TIME_FORMAT))

target_months = []


(0..INPUT_MONTHS-1).each do |index|

	temp = {}

	if index == 0
		temp[:start] = (today<< 1).to_s
		temp[:end] = today.to_s
	else
		temp[:start] = (today<< index+1).to_s
		temp[:end] = (today<< index).to_s
	end

	target_months[index] = temp

end


target_months.each do |date_range|

	start_date 	= date_range[:start]
	end_date 		= date_range[:end]

	url = "https://api.github.com/repos/#{OWNER}/#{REPO}/contributors?from=#{start_date}&to=#{end_date}"

	response = HTTParty.get(url)

	if response.code == 200
		results = Oj.load(response.body, symbol_keys: true)

		p "Most active contributors from #{start_date} to #{end_date} are"
		results[0..TOP-1].each do |result|
			p result[:login]
		end
	else
		p response.body
		break
	end

end






