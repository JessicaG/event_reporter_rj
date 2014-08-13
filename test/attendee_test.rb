require_relative 'test_helper'

class AttendeeTest <MiniTest::Test

  def setup
    attendee = Attendee.build(row)
  end

  def row
    { _: "1",
      regdate: "11/12/08 10:47",
      first_name:"Allison",
      last_name: "Nguyen",
      email_address:"arannon@jumpstartlab.com",
      homephone: "615.438-5000",
      street: "3155 19th St NW",
      city: "Washington",
      state: "DC",
      zipcode: "20010"}
  end

  def test_it_can_clean_attributes
    attendee = Attendee.build(row)
    assert row[:_], attendee.id
    assert row[:regdate], attendee.regdate
    assert row[:first_name], attendee.first_name
    assert row[:last_name], attendee.last_name
    assert row[:homephone], attendee.homephone
    assert row[:email_address], attendee.email_address
    assert row[:street], attendee.street
    assert row[:city], attendee.city
    assert row[:state], attendee.state
    assert row[:zipcode], attendee.zipcode
  end

end
