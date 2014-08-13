require 'terminal-table'
require 'pry'

class UserCommand
  include MessagePrinter

  attr_reader :search, :complete_list, :queue

  def initialize
    @complete_list = []
    @queue = Queue.new
  end

  def find(kind, query)
    puts "#{kind} #{query}"
    results = Search.new(complete_list).send(kind.to_sym, query)
    queue.add_to_attendees(results)
  end

  def load(file_path)
    file_path = "./data/event_attendees_test.csv" if file_path.nil?

    @complete_list = AttendeeRepo.load(file_path)
    puts complete_list
  end

end
