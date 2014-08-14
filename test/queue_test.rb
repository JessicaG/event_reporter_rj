require_relative 'test_helper'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  attr_reader :queue, :person

  def setup
    @queue = Queue.new

   @person = {
     first_name:"Allison",
     last_name: "Nguyen",
     email_address:"arannon@jumpstartlab.com",
     homephone: "615.438-5000",
     street: "3155 19th St NW",
     city: "Washington",
     state: "DC",
     zipcode: "20010"}
   end

	def test_it_exists
   assert Queue
  end

  def test_user_command_initializes_an_empty_array
   assert_equal [], queue.attendees
  end

  def test_it_adds_to_attendees
  	queue.add_to_attendees(person)
  	assert_equal "Allison", queue.attendees.first[1]
  end

  def test_it_can_clear_a_queue
   queue.attendees <<  person
	 assert_equal [], queue.clear
  end

end
