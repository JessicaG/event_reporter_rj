require 'colorize'
require_relative 'messageprinter'

class CommandLineInterface
	attr_reader :messages,
							:command,
							:search,
							:parameters,
							:queue  # => nil

	def initialize()
		@messages = MessagePrinter.new
		@command 	= UserCommand.new
		@queue 		= []
	end

	def run
		system 'clear'
    messages.intro
		command = ''
		until command == 'quit'
			messages.initial_prompt
			parts  			= gets.strip.split
			command 		= parts[0]
			@parameters = parts[1..-1]
			process_commands(command, parameters)
		end
	end

	def process_commands(command, parameters=nil)
		case command
		when "help"  then user_command.help(parameters)
		when "load"  then user_command.load_file(parameters)
		when "queue" then user_command.queue(parameters)
		when "find"  then	user_command.find(parameters[0], parameters[-1])
		when "quit"  then quit_program
		else
			puts messages.invalid_command_message
		end
		messages.outro_message
	end

	def quit_program
		exit
	end

end
