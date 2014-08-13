require 'csv'

class AttendeeRepo
  attr_reader :csv, :records

  def self.load(filename="./data/event_attendees.csv")
    new(filename).build_attendees
  end

  def initialize(filename="./data/event_attendees.csv")
    @records = []
    @csv     = CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def build_attendees
    @records = csv.collect { |row| Attendee.build(row) }
  end
end