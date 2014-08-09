require 'csv'

class AttendeeRepo
  attr_reader :csv, :records

  def initialize(filename = "./data/event_attendees_test.csv")
    @records = []
  end

  #let's use .map on this, review Monday after Enumerables lesson
  def load(filename)
    if File.file?(filename)
      @csv     = CSV.open(filename, headers: true, header_converters: :symbol)
      true
    else
      false
    end
  end

  def build_records
    csv.each { |row| @records << Attendee.build(row) }
    records
  end

end
