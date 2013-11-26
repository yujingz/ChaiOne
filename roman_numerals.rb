input = (1..100)

def to_roman(number)

	if number >= 0 and number <= 100
		return "" if number < 1
		return "C#{to_roman(number - 100)}" if number >= 100
		return "XC#{to_roman(number - 90)}" if number >= 90
		return "L#{to_roman(number - 50)}" if number >= 50
		return "XL#{to_roman(number - 40)}" if number >= 40
		return "X#{to_roman(number - 10)}" if number >= 10
		return "IX#{to_roman(number - 9)}" if number >= 9
		return "V#{to_roman(number - 5)}" if number >= 5
		return "IV#{to_roman(number - 4)}" if number >= 4
		return "I#{to_roman(number - 1)}" if number >= 1
	else
		raise "Error"
	end

end

input.each do |number|
	p "#{number} = #{to_roman number}"
end
