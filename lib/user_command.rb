require 'terminal-table'

class UserCommand

  def initialize
    @messages = MessagePrinter.new
  end

  def load_file(filename="./data/event_attendees_test.csv")
    repo = AttendeeRepo.new(filename).build_records
    #@queue = Search.new(repo)
  end

  def find(kind, query)
    results = search.send(kind.to_sym, query)
    results.each { |person| puts "#{person.first_name} #{person.last_name} #{person.city}"}
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
      when 'save' then messages.help_queue_save_to_message
    end
  end

  def queue(sub_command)

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
