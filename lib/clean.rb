class Clean

	def first_name(first_name)
		first_name.downcase
	end

  def zipcode(zipcode)
 	  zipcode.to_s.rjust(5,"0")[0..4]
  end

  def homephone(phone_number)
    
    digits = remove_non_digit_characters(phone_number)
	  if digits.length == 10
	     digits
	  elsif digits.length < 10 || digits.length > 11
	    "Bad Number"
	  elsif digits.length == 11 && digits[0] == "1"
	    digits[1..-1]
    end
  end

  def remove_non_digit_characters(string)
    if string =~ /[^0-9]/
	     string = string.gsub(/[^0-9]/,"")
	  end
	  string
  end
end 
 






