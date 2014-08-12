#require 'terminal-table'
require_relative 'search'
require 'pry'

class UserCommand
  attr_reader :messages, :search, :queue

  def initialize(attendees)
    @messages = MessagePrinter.new
    @search   = Search.new(attendees)
    @queue    = Queue.new
  end

  def find(kind, query)
    search.send(kind.to_sym, query)
  end

  def help(sub_command)
    if sub_command.length < 1 then messages.help_options_message
      case sub_command[0]
      when 'find' then messages.help_find_message
      when 'queue' then queue_help(sub_command)
      end
    end
  end

  def queue_help(sub_command)
    case sub_command[1]
    when 'count' then messages.help_queue_count_message
    when 'clear' then messages.help_queue_clear_message
    when 'print' then messages.help_queue_print_message
    when 'save'  then messages.help_queue_save_to_message
    end
  end

  def queue(sub_command)
    case sub_command[0]
    when "count"
      queue.count
    when "clear"
      queue.clear
    when "print"
      queue.print
    when "save"
      queue.save
    end
  end

  def queue_save_by(filename)
    CSV.open(create_filename(filename), 'w') do |csv|
    csv << ['ID', 'RegDate', 'First Name', 'Last Name', 'Email Address', 'Home Phone', 'Street', 'City', 'State', 'Zip Code']
    @queue.each do |a|
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
