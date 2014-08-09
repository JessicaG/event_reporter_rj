require_relative 'test_helper'

class CommandLineInterface < MiniTest::Test

  def test_it_can_load_a_file
  end

  def test_it_can_call_on_help_command
  end

  def test_it_can_find_by_attribute_and_value
    skip
    a = AttendeeRepo.new(records)
    result = a.find(first_name: 'Aya').first
    assert_equal 'Aya', result.first_name
    assert_equal 'Fuller', result.last_name
  end


  def test_it_can_count_records_in_queue
  end

  def test_it_can_print_queue
  end

  def test_it_can_save_to_csv
  end


end
