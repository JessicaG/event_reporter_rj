require 'csv'
require_relative 'attendee'

class AttendeeRepo
  attr_reader :csv, :records

  def self.load(filename="./data/event_attendees_test.csv")
    new(filename).build_attendees
  end

  def initialize(filename)
    @records = []
    @csv     = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_attendees
    @records = csv.collect { |row| Attendee.build(row) }
  end
end


# repo = AttendeeRepo.new
# puts repo.build_records
