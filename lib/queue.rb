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
    table = Terminal::Table.new :rows => rows

    attendees
  end

  def count
    attendees.count
  end
end
