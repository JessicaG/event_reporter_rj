class CommandLineInterface
	attr_reader :messages, :command

	def initialize()
		@messages = MessagePrinter.new
		@command = ""
	end

	def run
		system 'clear'
    messages.intro
		until command == "quit"
			messages.command_request
			parts  = gets.strip.split
			command = parts[0]
			parameters = parts[1..-1]
			process_commands(command, parameters)
		end	
	end

	def process_commands(command, parameters)
		case command
		when "help"  then
		when "load"  then
		when "queue" then
		when "quit"  then quit_program
		end
	end

	def quit_program
		exit
	end
	


end	
