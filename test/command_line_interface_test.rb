require_relative 'test_helper'

class CommandLineInterfaceTest < MiniTest::Test
  attr_reader :cli

  def setup
    @cli = CommandLineInterface.new
  end

  def test_help_calls_help_find
    cli = CommandLineInterface.new

   ['count', 'clear', 'print', 'save'].each do |command|
     one = capture_io { cli.queue_help(['queue', "#{command}"]) }
     two = capture_io {cli.help(['queue', "#{command}"])}
     assert_equal one, two
   end
  end

  def test_it_creates_a_user_command_instance
    assert_instance_of UserCommand, cli.user_command
  end

  def test_it_exists
    assert CommandLineInterface
  end

  def test_if_it_has_MessagePrinter_module
    assert MessagePrinter
  end

  def test_it_has_an_instance_of_UserCommand
    assert cli.user_command
  end

  def test_it_has_a_process_commands_method
    assert cli.respond_to?(:process_commands)
  end

  def test_it_has_a_method_run
    assert cli.respond_to?(:run)
  end

  def test_it_has_a_queue_method
    assert cli.respond_to?(:queue)
  end
end
