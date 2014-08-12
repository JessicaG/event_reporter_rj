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
    command = UserCommand.new
    command.load(data)
    assert_equal 4, command.count
  end

  def test_it_can_clear_the_queue
    queue = UserCommand.new
    queue.load(data)
    assert [], que.clear
  end

  def test_it_can_find_by_first_name
    repo = Attedee.new('./event_attendees_test.csv').build_records
    queue = UserCommand.new
    queue.find(:first_name, 'Allison')
    assert_equal ['Allison'], queue.results.to_s("Allison")
  end

  def test_it_can_find_by_last_name
    repo = Attedee.new('./event_attendees_test.csv').build_records
    queue = UserCommand.new
    queue.find(:last_name, 'Nguyen')
    assert_equal ['Nguyen'], queue.results.to_s("Nguyen")
  end

  def test_it_can_find_by_city
    repo = Attedee.new('./event_attendees_test.csv').build_records
    queue = UserCommand.new
    queue.find(:city, 'Washington')
    assert_equal ['Washington'], queue.results.to_s("Washington")
  end

  def test_it_can_find_by_state
    repo = Attedee.new('./event_attendees_test.csv').build_records
    queue = UserCommand.new
    queue.find(:state, 'DC')
    assert_equal ['DC'], queue.results.to_s("DC")
  end

  def test_it_can_find_by_zip_code
    repo = Attedee.new('./event_attendees_test.csv').build_records
    queue = UserCommand.new
    queue.find(:zip_code, '20010')
    assert_equal ['20010'], queue.results.to_s("20010")
  end

end
