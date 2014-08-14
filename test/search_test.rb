require_relative 'test_helper'
require_relative '../lib/attendee_repo'
require_relative '../lib/search'


class SearchTest < MiniTest::Test
  attr_reader :attendees, :search

  def setup
    @attendees = AttendeeRepo.load
    @search = Search.new(attendees)
  end

  def test_it_exists
    assert Search
  end

  def test_it_can_find_by_first_name
    results = search.first_name("Allison")
    assert_equal 'allison', results.first.first_name
  end

  def test_it_can_find_by_last_name
    results = search.last_name("nguyen")

    assert_equal 'nguyen', results.first.last_name
  end

  def test_it_can_find_by_city
    results = search.city("San juan")

    assert_equal 'San Juan', results.first.city
  end

  def test_it_can_find_by_state
    results = search.state("CA")

    assert_equal 'CA', results.first.state
  end

  def test_it_can_find_by_zip_code
    results = search.zipcode("20010")

    assert_equal '20010', results.first.zipcode
  end
end
