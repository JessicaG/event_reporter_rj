require_relative 'test_helper'

class AttendeeRepoTest <MiniTest::Test

  def test_it_can_create_a_csv
    repo = AttendeeRepo.new(nil)
    repo.load('./test/event_attendess_test.csv')
    assert repo.csv.is_a? CSV
  end

  def test_it_doesnt_load_a_nonexisting_file
    repo = AttendeeRepo.new(nil)
    repo.load('./test/event_attendess_test.csv')
    assert_equal 0, repo.csv.count
  end

  def test_it_builds_entries
    repo = AttendeeRepo.new(value)
    repo.load('./test/fevent_attendess_test.csv')
    repo.build_entries
    assert_equal 4, repo.entries.count
  end

  def test_it_sets_the_attributes
    repo = AttendeeRepo.new(value)
    assert_equal [:first_name], repo.attributes
  end


end
