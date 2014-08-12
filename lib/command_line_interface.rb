class CommandLineInterface
	attr_reader :messages, :command, :search, :parameters, :queue  # => nil

	def initialize()
		@messages = MessagePrinter.new
		@command = ""
		@queue = []
	end

	def run
		system 'clear'
    messages.intro
		until command == "quit"
			messages.command_request
			parts  = gets.strip.split
			command = parts[0]
			@parameters = parts[1..-1]
			process_commands(command, parameters)
		end	
	end

	def process_commands(command, parameters=nil)
		case command
		when "help"  then
		when "load"  then load(parameters)
		when "queue" then
		when "find"  then	find(parameters[0], parameters[-1])		
		when "quit"  then quit_program
		end
	end

	def quit_program
		exit
	end

	def load(filename="./data/event_attendees_test.csv")
		repo = AttendeeRepo.new(filename).build_records
		#@queue = Search.new(repo)
	end

	def find(kind, query)
	  results = search.send(kind.to_sym, query)	
	  results.each { |person| puts "#{person.first_name} #{person.last_name} #{person.city}"}
	end
end	
