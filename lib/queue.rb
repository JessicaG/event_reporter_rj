require 'terminal-table'

class Queue
  include MessagePrinter
  attr_accessor :attendees

  def initialize
    @attendees = []
  end

  ###
  def add_to_attendees(results)
    results.each do |attendee|
      attendees << attendee
    end
  end

  ###
  def clear
    attendees.clear
  end

  def count
    attendees.count
  end

  def print_queue
    p "gorilla"
    if @attendees.empty?
      puts MessagePrinter.print_error_message
    else
      # attendee_array = attendees.flatten
      rows = attendees.collect do |a|
         [
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
    attendees.sort_by! do |record|
      record.send(attribute)
    end
    print_queue
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

  private

  def create_filename(filename)
    "output/#{filename}.csv"
  end

end
