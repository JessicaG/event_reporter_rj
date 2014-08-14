require_relative 'test_helper'
require_relative '../lib/search'
require_relative '../lib/queue'


class UserCommandTest < MiniTest::Test

  def test_it_exists
    assert UserCommand
  end

  def test_user_command_initializes_an_empty_array
    attendees = UserCommand.new
    assert_equal [], attendees.complete_list
  end  

  def test_user_command_load_creates_a_complete_list_of_attendees
    attendees = UserCommand.new
    attendees.load("./data/event_attendees.csv")
    
    assert_equal 5175, attendees.complete_list.length
  end  

  def test_user_command_can_load_a_different_file
    attendees = UserCommand.new
    attendees.load("./data/event_attendees_test.csv")
    
    assert_equal 20, attendees.complete_list.length
  end  

 def test_user_command_initializes_an_empty_array
    attendees = UserCommand.new
    assert_instance_of Queue, attendees.queue
  end   
end
