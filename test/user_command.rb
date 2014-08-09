require_relative 'test_helper'

class UserCommand < MiniTest::Test

 def data
  @data ||=
  [ Attendee.new({ id: 1, last_name: 'Nguyen' }),
    Attendee.new({ id: 2, last_name: 'Hankins'}),
    Attendee.new({ id: 4, last_name: 'Cope'}),
    Attendee.new({ id: 5, last_name: 'Zimmerman'})]
  end

  def test_it_loads_data
    command = UserCommand.new
    command.load(data)
    assert_equal 4, command.data.count
  end

  def test_it_can_count_attendees
    skip
    command = UserCommand.new
    command.load(data)
    assert_equal 4, command.count
  end

  def test_it_can_clear_the_queue
    skip
    que = UserCommand.new
    que.load(data)
    assert [], que.clear
  end

  def test_it_can_add_to_current_queue
    skip
    command = UserCommand.new
    command.load(data)
    assert_equal 4, command.count
    que.add([1, 2])
    assert_equal 6, command.count
  end

  def test_it_can_replace_current_queue
    skip
    command = UserCommand.new
    command.load([1, 2, 3, 4, 5, 6])
    command.subtract([1, 2])
    assert_equal [3, 4, 5, 6], command.data
  end

end
