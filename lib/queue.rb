require 'terminal-table'

class Queue
  attr_accessor :attendees

  def initialize
    @attendees = []
  end

  def save
    #save
  end

  def clear
    attendees.clear
  end

  def print
    
    # rows = attendees.collect {|attendee| puts attendee.inspect; attendee.to_row }
    attendees 
    # table = Terminal::Table.new :rows => rows
  end

  def count
    attendees.count
  end
end
