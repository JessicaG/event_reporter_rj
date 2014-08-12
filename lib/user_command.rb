require 'terminal-table'

class UserCommand

  def load(filename="./data/event_attendees_test.csv")
    repo = AttendeeRepo.new(filename).build_records
    #@queue = Search.new(repo)
  end

  def find(kind, query)
    results = search.send(kind.to_sym, query)
    results.each { |person| puts "#{person.first_name} #{person.last_name} #{person.city}"}
  end

end
