class Clean

  def id(id)
    id.to_i
  end

  def regdate(regdate)
    regdate
  end

	def first_name(first_name)
		if first_name.nil?
			"No Name"
		else
		  first_name.downcase
		end
	end

  def last_name(last_name)
		if last_name.nil?
			"No Name"
		else
		  last_name.downcase
		end
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

  def email_address(email_address)
  	if email_address =~ /^[^@]+@[^@]+\.[^@]+$/
  		email_address
  	else
  	  "Bad Email"
  	end
  end

  def remove_non_digit_characters(string)
    if string =~ /[^0-9]/
      string.gsub(/[^0-9]/, "")
    else
	    string.to_s
    end
  end

  def street(street)
  	if street.nil?
  		"No Street"
  	else
  	  street
  	end
  end

  def city(city)
  	if city.nil?
  		"No City"
  	else
  	  city
  	end
  end

  def state(state)
  	if state.to_s.length == 2
  	  state.upcase
  	else
  	  "Bad State"
  	end
  end
end
