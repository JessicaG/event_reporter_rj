require_relative 'test_helper'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
	attr_reader :queue
	
	def test_it_exists
    assert Queue
  end

  def test_user_command_initializes_an_empty_array
    @queue = Queue.new
    assert_equal [], queue.attendees
  end  


	# def test_it_loads_the_data
	# 	# We want to call/ count load up data in order to count it.
	# end

	def test_it_can_clear_a_queue
    
	end

	# def test_it_can_print
		
	# 	# assert TerminalTable.new()
	# end

	# def test_it_can_save_to_csv
	# 	# calling queue save saves the queue to a file
	# end
end