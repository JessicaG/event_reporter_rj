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
    attendees.flatten.count
  end

  def print(attendees=attendees)
    if @attendees.empty?
      puts MessagePrinter.print_error_message
    else
      attendee_array = attendees.flatten
      rows = []
      attendee_array.each do |a|
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
    flat = attendees.flatten
    results = flat.sort_by! do |record|
      record.send(attribute)
    end
    print(results)
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
