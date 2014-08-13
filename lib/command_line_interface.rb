require 'colorize'                 # => true
require_relative 'messageprinter'  # => true

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
	end

	def process_commands(command, parameters)
		case command
		when "help"  then user_command.help(parameters)
		when "load"  then user_command.load(parameters)
		when "queue" then queue(parameters)
		when "find"  then	user_command.find(parameters[0], parameters[-1])
		when "quit"  then quit_program
		else
		 MessagePrinter.invalid_command
		end
		MessagePrinter.outro
	end

	def queue_help(sub_command)
		case sub_command[1]
		when 'count' then MessagePrinter.help_queue_count_message
		when 'clear' then MessagePrinter.help_queue_clear_message
		when 'print' then MessagePrinter.help_queue_print_message
		when 'save'  then MessagePrinter.help_queue_save_to_message
		end
	end

	def queue(sub_command)
		case sub_command[0]
		when "count"
			MessagePrinter.queue_results_message_count(user_command.search_results.attendees.count)
		when "clear"
			search_results.clear
			MessagePrinter.clear_queue_successful_message
		when "print"
			user_command.search_results.print
		when "save"
			search_results.save
		end
	end

	def quit_program
		exit
	end
end
