require 'csv'

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