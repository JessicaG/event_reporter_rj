require_relative 'test_helper'

class AttendeeRepoTest <MiniTest::Test

  def test_it_can_create_a_csv
    repo = AttendeeRepo.new(nil)
    repo.load('./test/event_attendess_test.csv')
    assert repo.csv.is_a? CSV
  end

  def test_it_loads_file_by_default
    repo = AttendeeRepo.new(nil)
    repo.load('./test/event_attendess_test.csv')
    assert_equal 0, repo.csv.count
  end

  def test_it_can_build_attendee_records
    repo = AttendeeRepo.new(filename)
    repo.load('./test/fevent_attendess_test.csv')
    repo.build_records
    assert_equal 4, repo.records.count
  end

  def test_it_assigns_header_values
    attendees = AttendeeRepo.load
    assert_equal [:first_name], attendees.first
  end


end
