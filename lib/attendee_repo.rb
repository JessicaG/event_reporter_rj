require 'csv'
require_relative 'attendee'

class AttendeeRepo
  attr_reader :csv, :records

  def initialize(filename="./data/event_attendees_test.csv")
    @records = []
    @csv     = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  #let's use .map on this, review Monday after Enumerables lesson
  # def load(filename)
  #   if File.file?(filename)
  #     @csv     = CSV.open(filename, headers: true, header_converters: :symbol)
  #     true
  #   else
  #     false
  #   end
  # end

  def build_records
    records = csv.collect { |row| Attendee.build(row) }
  end
end


# repo = AttendeeRepo.new
# puts repo.build_records
