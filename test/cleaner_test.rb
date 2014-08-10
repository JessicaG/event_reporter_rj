require_relative 'test_helper'     # => true
require_relative '../lib/cleaner'  # => false

class CleanerTest <MiniTest::Test
	attr_reader :cleaner              # => nil

	def setup
		@cleaner = Cleaner.new  # => #<Cleaner:0x000001014223c0>
	end

	def test_if_zipcode_is_nil_returns_five_zeros
		zip_code = nil                                           # => nil
    assert_equal "00000", cleaner.clean_zipcode(zip_code)  # => true
	end

	def test_if_zipcode_is_less_than_five_digits_adds_extra_zeros
		zip_code = "0345"
		assert_equal "00345", cleaner.clean_zipcode(zip_code)
	end
  
  def test_if_zip_code_is_more_than_five_digits_only_registers_first_five
  	zip_code = "902700"
  	assert_equal "90270", cleaner.clean_zipcode(zip_code)
  end

  def test_phone_cleaner_removes_non_digit_characters
  	phone_number = "(323)735-1802"
  	assert_equal "3237351802", cleaner.clean_phone_number(phone_number)
  end

  def test_phone_cleaner_considers_less_than_10_numbers_bad
  	phone_number = "4735180"
  	assert_equal "Bad Number", cleaner.clean_phone_number(phone_number)
  end

  def test_phone_cleaner_considers_more_than_11_numbers_bad
  	phone_number = "456345424566"
  	assert_equal "Bad Number", cleaner.clean_phone_number(phone_number)
  end

  def test_if_phone_number_length_is_10_assume_its_good
  	phone_number = "3237351802"
  	assert_equal "3237351802", cleaner.clean_phone_number(phone_number)
  end

  def test_if_phone_number_has_eleven_digits_and_begins_with_1_it_removes_the_1_and_returns_the_rest
    phone_number = "13237351802"
    assert_equal "3237351802", cleaner.clean_phone_number(phone_number)	
  end
end

# >> Run options: --seed 64849
# >> 
# >> # Running:
# >> 
# >> [38;5;154m.[0m
# >> 
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001157s, 864.3042 runs/s, 864.3042 assertions/s.
# >> 
# >> 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
