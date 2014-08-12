require 'terminal-table'
require_relative 'search'
require 'pry'

class UserCommand
  include MessagePrinter

  attr_reader :search
  attr_accessor :complete_list, :search_results

  def initialize
    @complete_list  = []
    @search_results = Queue.new
  end

  def find(kind, query)
     search_results.attendees << Search.new(complete_list).send(kind.to_sym, query)
  end

  def help(sub_command)
    if sub_command.length < 1 then messages.help_options_message
      case sub_command[0]
      when 'find' then messages.help_find_message
      when 'queue' then queue_help(sub_command)
      end
    end
  end

  def load(file_path="./data/event_attendees_test.csv")
    if !file_path
      file_path = "./data/event_attendees_test.csv"
    end  
      complete_list = AttendeeRepo.load(file_path)

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
      MessagePrinter.queue_results_message_count(search_results.count)
    when "clear"
      search_results.clear
      MessagePrinter.clear_queue_successful_message
    when "print"
      search_results.print
    when "save"
      search_results.save
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
