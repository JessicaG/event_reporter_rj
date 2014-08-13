Dir["./lib/*.rb"].each { |file| require file }

CommandLineInterface.new.run