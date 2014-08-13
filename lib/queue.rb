require 'terminal-table'
require_relative 'attendee'

class Queue
  include MessagePrinter 
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
    if @attendees.empty?
        puts MessagePrinter.print_error_message
    else
      #@attendees.each { |attendee| puts attendee.id  }

      rows = []
      @attendees.each do |a|
        rows << [
          "#{a.id}",
          "#{a.regdate}",
          "#{a.first_name}",
          "#{a.last_name}",
          "#{a.email_address}",
          "#{a.homephone}",
          "#{a.street}",
          "#{a.city}",
          "#{a.state}",
          "#{a.zipcode}"
        ]
      end
      table = Terminal::Table.new :title => "Queue Results", :headings => ['ID', 'RegDate', 'First Name', 'Last Name', 'Email Address', 'Home Phone', 'Street', 'City', 'State', 'Zip Code'], :rows => rows
      puts table
    end
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
