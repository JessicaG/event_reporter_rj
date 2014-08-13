require 'colorize'                 # => true
require_relative 'message_printer'

class CommandLineInterface
	include MessagePrinter     # => CommandLineInterface

	attr_reader	:user_command,  # => :user_command
							:search,              # => :search
							:parameters,          # => :parameters
							:queue              # => :queue

	def initialize
		@user_command = UserCommand.new
	end

	def run
		system 'clear'
    MessagePrinter.intro
		command = ''
		until command == 'quit'
			MessagePrinter.initial_prompt
			parts  			= gets.strip.split
			command 		= parts[0]
			@parameters = parts[1..-1].empty? ? nil : parts[1..-1]
			process_commands(command, parameters)
		end
    MessagePrinter.outro
	end

	def process_commands(command, parameters)
		case command
		when "help"  then help(parameters)
		when "load"  then user_command.load(parameters)
		when "queue" then queue(parameters)
		when "find"  then	user_command.find(parameters[0], parameters[1..-1].join(' '))
		when "quit"  then quit_program
		else
		  MessagePrinter.invalid_command
		end
	end

  def help(sub_command)
      case sub_command[0]
      when nil then MessagePrinter.help_options
      when 'find'  then MessagePrinter.help_find
      when 'queue' then queue_help(sub_command)
    end
  end

	def queue_help(sub_command)
		case sub_command[1]
		when 'count' then MessagePrinter.help_queue_count
		when 'clear' then MessagePrinter.help_queue_clear
		when 'print' then MessagePrinter.help_queue_print
		when 'save'  then MessagePrinter.help_queue_save_to
		end
	end

	def queue(sub_command)
		case sub_command[0]
		when "count"
			MessagePrinter.queue_results_message_count(user_command.queue.count)
		when "clear"
			user_command.queue.clear
			MessagePrinter.clear_queue_successful
		when "print"
      case sub_command[1]
        when "by" then user_command.queue.print_by(sub_command[2])
      end
		  user_command.queue.print
		when "save"
			search_results.save
		end
	end

	def quit_program
		exit
	end
end
