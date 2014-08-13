require 'terminal-table'
require 'pry'

class UserCommand
  include MessagePrinter

  attr_reader :search, :complete_list, :queue

  def initialize
    @complete_list = []
    @queue = Queue.new
  end

  def find(kind, query)
    puts "#{kind} #{query}"
    queue.attendees = Search.new(complete_list).send(kind.to_sym, query)
  end

  def help(sub_command)
    if sub_command.length < 1 then messages.help_options_message
      case sub_command[0]
      when 'find'  then messages.help_find_message
      when 'queue' then queue_help(sub_command)
      end
    end
  end

  def load(file_path)
    file_path = "./data/event_attendees_test.csv" if file_path.nil?
    
    @complete_list = AttendeeRepo.load(file_path)
    puts complete_list
  end

  def queue_save_by(filename)
    CSV.open(create_filename(filename), 'w') do |csv|
      csv << ['ID', 'RegDate', 'First Name', 'Last Name', 'Email Address', 'Home Phone', 'Street', 'City', 'State', 'Zip Code']
      @queue.each do |a|
        csv << a.to_row
      end
    end
  end

  private

  def create_filename(filename)
    "output/#{filename}.csv"
  end
end
