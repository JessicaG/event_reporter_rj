require 'terminal-table'

class Queue
  attr_accessor :attendees

  def initialize
    @attendees = []
  end

  def save_by(filename)
    #save
  end

  def clear
    attendees.clear
  end

  # def print
  #
  #   # rows = attendees.collect {|attendee| puts attendee.inspect; attendee.to_row }
  #   attendees
  #   # table = Terminal::Table.new :rows => rows
  # end

  def print
    if @queue.empty?
        puts MessagePrinter.print_error_message
    else
      rows = []
      @search_results.to_row
    table = Terminal::Table.new :title => "Queue Results", :headings => ['ID', 'RegDate', 'First Name', 'Last Name', 'Email Address', 'Home Phone', 'Street', 'City', 'State', 'Zip Code'], :rows => rows
  end

  def queue_print_by_attribute(attribute)
    queue.sort_by! do |record|
      record.send(attribute)
    end
    queue_print
  end

  def count
    attendees.count
  end
end
