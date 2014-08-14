require 'terminal-table'
require_relative 'message_printer'

class Queue
  include MessagePrinter
  attr_accessor :attendees

  def initialize
    @attendees = []
  end

  def add_to_attendees(results)
    if queue_attendees_each_find?
    results.each do |attendee|
      attendees << attendee
    end
    else
      clear_queue
      add_to_attendees(results)
    end
  end

  def queue_attendees_each_find?
    attendees.empty?
  end

  def clear_queue
    attendees.clear
  end

  def count
    attendees.count
  end

  def print_queue
    if @attendees.empty?
      puts MessagePrinter.print_error_message
    else
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
    puts MessagePrinter.save_queue_to_csv_successful
    clear_queue
  end

  private

  def create_filename(filename)
    "output/#{filename}.csv"
  end

end
