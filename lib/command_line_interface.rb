require 'colorize'
require_relative 'messageprinter'

class CommandLineInterface
	include MessagePrinter
	
	attr_reader	:user_command,
							:search,
							:parameters,
							:queue

	def initialize
		@user_command = UserCommand.new
		@queue 		    = []
	end

	def run
		system 'clear'
    MessagePrinter.intro_message
		command = ''
		until command == 'quit'
			MessagePrinter.initial_prompt
			parts  			= gets.strip.split
			command 		= parts[0]
			@parameters = parts[1..-1].empty? ? nil : parts[1..-1] 
			process_commands(command, parameters)
		end
	end

	def process_commands(command,parameters)
		case command
		when "help"  then user_command.help(parameters)
		when "load"  then user_command.load(parameters)
		when "queue" then user_command.queue(parameters)
		when "find"  then	user_command.find(parameters[0], parameters[-1])
		when "quit"  then quit_program
		else
		 MessagePrinter.invalid_command_message
		end
		MessagePrinter.outro_message
	end

	def quit_program
		exit
	end
end


