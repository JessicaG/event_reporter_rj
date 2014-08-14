require_relative 'test_helper'

class CommandLineInterfaceTest < MiniTest::Test

  def test_it_creates_a_user_command_instance
    cli = CommandLineInterface.new
    assert_instance_of UserCommand, cli.user_command
  end

  def test_help_gets_called
    cli = CommandLineInterface.new
    # assert_send([cli, :help, "find"])    
    cli.process_commands("help", "find")    
  end

  def test_it_can_call_on_help_command
    skip
  end



  def test_it_can_count_records_in_queue
    skip
  end

  def test_it_can_print_queue
    skip
  end

  def test_it_can_save_to_csv
    skip
  end


end
