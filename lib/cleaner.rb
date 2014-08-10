class Cleaner

  def clean_zipcode(zipcode)
 	  zipcode.to_s.rjust(5,"0")	[0..4]
  end

  def clean_phone_number(phone_number)
	  if phone_number =~ /[^0-9]/
	   phone_number = phone_number.gsub(/[^0-9]/,"")
	  end
	  
	  if phone_number.length == 10
	    phone_number
	  elsif phone_number.length < 10 || phone_number.length > 11  
	    "Bad Number"	    	  
	  elsif phone_number.length == 11 && phone_number[0] == "1"
	    phone_number[1..-1]
    end
  end
end
