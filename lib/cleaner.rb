class Cleaner

	def first_name_cleaner(first_name)
		first_name.downcase
	end

  def clean_zipcode(zipcode)
 	  zipcode.to_s.rjust(5,"0")[0..4]
  end

  def clean_phone_number(phone_number)
    
    only_digits = remove_non_digit_characters(phone_number)
	  if only_digits.length == 10
	    only_digits
	  elsif only_digits.length < 10 || only_digits.length > 11
	    "Bad Number"
	  elsif only_digits.length == 11 && only_digits[0] == "1"
	    only_digits[1..-1]
    end
  end

  def remove_non_digit_characters(phone_number)
    if phone_number =~ /[^0-9]/
	    phone_number = phone_number.gsub(/[^0-9]/,"")
	  end
	  phone_number
  end
end  






