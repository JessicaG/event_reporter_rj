require_relative 'test_helper'
require_relative '../lib/search'
require_relative '../lib/queue'


class UserCommandTest < MiniTest::Test

  def test_user_command_initializes_an_empty_array
    attendees = UserCommand.new
    assert_instance_of Array, attendees.complete_list
  end  

  def test_it_can_find_by_first_name
    attendees = AttendeeRepo.load
    results    = UserCommand.new.find("first_name", 'Allison')

    assert_equal 'allison', results.first.first_name
  end

  # def test_it_can_find_by_last_name
  #   attendees = AttendeeRepo.load
  #   result    = UserCommand.new(attendees).find(:last_name, 'Nguyen').first

  #   assert_equal 'nguyen', result.last_name
  # end

  # def test_it_can_find_by_city
  #   attendees = AttendeeRepo.load
  #   result    = UserCommand.new(attendees).find(:city, 'Washington').first

  #   assert_equal 'Washington', result.city
  # end

  # def test_it_can_find_by_state
  #   attendees = AttendeeRepo.load
  #   result    = UserCommand.new(attendees).find(:state, 'DC').first

  #   assert_equal 'DC', result.state
  # end

  # def test_it_can_find_by_zip_code
  #   attendees = AttendeeRepo.load
  #   result    = UserCommand.new(attendees).find(:zipcode, '20010').first

  #   assert_equal '20010', result.zipcode
  # end
end
