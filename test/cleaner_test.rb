require_relative 'test_helper'


class CleanTest <MiniTest::Test
	attr_reader :clean

	def setup
		@clean = Clean.new
	end

  def test_turns_id_into_integer
    id = "1"
    assert_equal 1, clean.id(id)
  end

  def test_does_nothing_for_regdate
    regdate = "11/12/08 10:47"
    assert_equal "11/12/08 10:47", clean.regdate(regdate)
  end

	def test_if_zipcode_is_nil_returns_five_zeros
		zip_code = ""
    assert_equal "00000", clean.zipcode(zip_code)
	end

	def test_if_zipcode_is_less_than_five_digits_adds_extra_zeros
		zip_code   = "345"
		assert_equal "00345", clean.zipcode(zip_code)
	end

  def test_if_zip_code_is_more_than_five_digits_only_registers_first_five
  	zip_code   = "902700"
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

  def test_if_a_empty_first_name_returns_no_name
    first_name = ""
    assert_equal "", clean.first_name(first_name)
  end

  def test_if_a_name_with_uppercase_letters_gets_downcased
    first_name = "JoNNy"
    assert_equal = "jonny", clean.first_name(first_name)
  end

  def test_if_a_empty_last_name_returns_no_name
    last_name = ""
    assert_equal "", clean.last_name(last_name)
  end

  def test_if_a_name_with_uppercase_letters_gets_downcased
    last_name = "RIcHARdSOn"
    assert_equal = "richardson", clean.last_name(last_name)
  end

  def test_if_an_email_address_is_valid_it_returns_the_email_address
    email = "robert@gmail.com"
    assert_equal "robert@gmail.com",  clean.email_address(email)
  end

  def test_if_an_email_address_is_invalid_it_returns_bad_email
    email = "@rdfd.com"
    assert_equal "Bad Email",  clean.email_address(email)
  end

  def test_if_street_is_empty_returns_no_street
    street = ""
    assert_equal "", clean.street(street)
  end

  def test_if_state_length_isnt_two_return_bad_state
    state = "CAA"
    assert_equal "Bad State", clean.state(state)
  end

  def test_if_state_length_is_two_return_upcased_state
    state = "ca"
    assert_equal "CA", clean.state(state)
  end
end
