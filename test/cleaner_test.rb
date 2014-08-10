require_relative 'test_helper'
require_relative '../lib/clean'

class CleanTest <MiniTest::Test
	attr_reader :clean

	def setup
		@clean = Clean.new
	end

	def test_if_zipcode_is_nil_returns_five_zeros
		zip_code = nil
    assert_equal "00000", clean.zipcode(zip_code)
	end

	def test_if_zipcode_is_less_than_five_digits_adds_extra_zeros
		zip_code = "0345"
		assert_equal "00345", clean.zipcode(zip_code)
	end
  
  def test_if_zip_code_is_more_than_five_digits_only_registers_first_five
  	zip_code = "902700"
  	assert_equal "90270", clean.zipcode(zip_code)
  end

  def test_phone_clean_removes_non_digit_characters
  	phone_number = "(323)735-1802"
  	assert_equal "3237351802", clean.homephone(phone_number)
  end

  def test_phone_clean_considers_less_than_10_numbers_bad
  	phone_number = "4735180"
  	assert_equal "Bad Number", clean.homephone(phone_number)
  end

  def test_phone_clean_considers_more_than_11_numbers_bad
  	phone_number = "456345424566"
  	assert_equal "Bad Number", clean.homephone(phone_number)
  end

  def test_if_phone_number_length_is_10_assume_its_good
  	phone_number = "3237351802"
  	assert_equal "3237351802", clean.homephone(phone_number)
  end

  def test_if_phone_number_has_eleven_digits_and_begins_with_1_it_removes_the_1_and_returns_the_rest
    phone_number = "13237351802"
    assert_equal "3237351802", clean.homephone(phone_number)	
  end
end
