require_relative 'test_helper'

class AttendeeRepoTest <MiniTest::Test

  def test_it_loads_event_attendees_file_by_default_when_using_self_method_load
    records = AttendeeRepo.load
    assert_equal 5175, records.count
  end

  def test_it_can_load_a_different_file
    file_path = "./data/event_attendees_test.csv"
    records = AttendeeRepo.load(file_path)
    assert_equal 20, records.count
  end

  def test_load_attendee_repo_creates_an_array
    attendees = AttendeeRepo.load
    assert_instance_of Array, attendees
  end

  def test_it_creates_an_instance_of_csv_file
    attendees = AttendeeRepo.new  
    assert_instance_of CSV, attendees.csv
  end

  def test_it_creates_an_empty_records_array_at_initialize
    attendees = AttendeeRepo.new  
    assert_empty attendees.records, attendees
  end
end
