input = (1..100)

input.each do |number|
	
	if number % 15 == 0
		p "DonkeyKong"
	elsif number % 5 == 0
		p "Kong"
	elsif number % 3 == 0 
		p "Donkey"
	else
		p number
	end

end