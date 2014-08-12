require_relative 'test_helper'

class AttendeeRepoTest <MiniTest::Test

  # def test_it_can_create_a_csv
  #   attendees = AttendeeRepo.load
  #   assert attendees.csv.is_a? CSV
  # end

  def test_it_loads_file_by_default
    records = AttendeeRepo.load
    assert_equal 20, records.count
  end

  # def test_it_can_build_attendee_records
  #   attendees = AttendeeRepo.load
  #   results   = UserCommand.new(attendees)
  #   assert_equal 20, attendees.results.count
  # end
  #
  # def test_it_assigns_header_values
  #   skip
  #   attendees = AttendeeRepo.load
  #   assert_equal [:first_name], attendees.records
  # end


end
