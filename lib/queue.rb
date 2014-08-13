require 'terminal-table'

class Queue
  include MessagePrinter
  attr_accessor :attendees

  def initialize
    @attendees = []
  end

  def clear
    attendees.clear
  end

  def count
    attendees.count
  end

  def print
    if @attendees.empty?
      puts MessagePrinter.print_error_message
    else
      flat_att = attendees.flatten
      rows = []; binding.pry
      flat_att.each do |a|
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

  def print_by(attribute)
    attendees.sort_by! do |attendee|
      attendee.send(attribute)
    end
    queue_print
  end

  def save(filename)
    CSV.open(create_filename(filename), 'w') do |csv|
    csv << ['ID', 'RegDate', 'First Name', 'Last Name', 'Email Address', 'Home Phone', 'Street', 'City', 'State', 'Zip Code']
    @attendees.each do |a|
      csv << [
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
    end
  end
end
