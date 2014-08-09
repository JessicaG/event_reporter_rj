require_relative 'test_helper'

class Attendee <MiniTest::Test

  def test_it_can_clean_attributes
    attendee = Attendee.build(row)
    assert cleaner[:_], attendee.id
    assert cleaner[:regdate], attendee.regdate
    assert cleaner[:first_name], attendee.first_name
    assert cleaner[:last_name], attendee.last_name
    assert cleaner[:homephone], attendee.homephone
    assert cleaner[:email_address], attendee.email_address
    assert cleaner[:street], attendee.street
    assert cleaner[:city], attendee.city
    assert cleaner[:state], attendee.state
    assert cleaner[:zipcode], attendee.zipcode
  end

end
