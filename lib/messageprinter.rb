require 'colorize'

class MessagePrinter

  def self.initial_prompt
    puts  "\n"
    print "Enter your command: ".colorize(:cyan)
  end

  def self.intro_message
    file = File.open("./assets/welcome.txt", "r")
    contents = file.read
    print contents
    puts "Welcome to Event Reporter, the easiest way to look at your CSV file!\nStart by (load)ing your file, go to (help) or (quit) to leave.".colorize(:magenta)
  end

  def self.outro_message
    puts "Thanks for using Event Reporter! Be sure to check back with us when you need to work with a CSV.".colorize(:magenta)
  end

  def self.records_loaded_message(records)
    puts "You have loaded #{records.count} records.".colorize(:yellow)
  end

  def self.queue_results_message_count(queue)
    puts "There are #{queue.count} records that match your criteria".colorize(:blue)
  end

  def self.invalid_command_message
    puts "That is in invalid command, check your syntax or use the help command to find more information".colorize(:red)
  end

  def self.invalid_help_command_message
    puts "I'm sorry, I cannot help you. Please try again.".colorize(:red)
  end

  def self.save_queue_to_csv_successful_message
    puts "You have successfully saved your current queue to a CSV in your output file.\n
          You can start another by starting a new search or clearing your queue.".colorize(:green)
  end

  def self.clear_queue_successful_message
    puts "You have successfully cleared your queue. You may now begin another search.".colorize(:green)
  end

  ### Helper Messaging ###

  def self.help_options_message
    puts "Here are your options:\n
          (find <attribute>) to find records in your file by their header line,\n
          (queue count) to discover the number of records in your current queue,\n
          (queue print) to display the records in your queue,\n
          (queue print by <attribute>) displays your queue sorted by the specified attribute like zipcode,\n
          (queue save to <example_filename>) to save your current queue to a csv with a specified filename,\n
          (queue clear) remove all the records in your current queue,\n
          (quit) to leave the program completely.\n"
  end

  def self.help_find_message
    puts "To search by a certain attribute, you must mimic your attribute how it is specificed in your header CSV file ie first_name or homephone"
  end

  def self.help_queue_count_message
    puts "Output how many records are in the current queue"
  end

  def self.help_queue_print_message
    puts "Output to screen all records you have in your current queue"
  end

  def self.help_queue_print_by_message
    puts "To print by a certain attribute, you must mimic your attribute to how\n it is specified in your find command and in your header file ie last_name or zipcode"
  end

  def self.help_queue_save_to_message
    puts "Output is saved as a CSV file to your output folder under the name specified after save to"
  end

  def self.help_queue_clear_message
    puts "This will clear your current queue"
  end

end
