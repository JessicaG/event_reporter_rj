require_relative 'attendee_repo'
require_relative 'clean'

class Search
	attr_reader :repo, :attendees, :clean

	def initialize(filename="./data/event_attendees_test.csv")
		@repo = AttendeeRepo.new(filename).build_records
		@clean = Clean.new
	end

	def first_name(name)
		name = name.downcase
		search_results = repo.keep_if {|attendee| attendee.first_name == name}
		puts search_results
	end

	def last_name(name)
		name = name.downcase
		search_results = repo.keep_if {|attendee| attendee.last_name == name}
		puts search_results
	end

	def zipcode(zipcode)
		clean.zipcode(zipcode)
		search_results = repo.keep_if {|attendee| attendee.zipcode == zipcode}
		search_results
	end

	def email(email)
		email = clean.email_address(email)
		search_results = repo.keep_if {|attendee| attendee.email_address == zipcode}
		puts search_results
	end

	def homephone(phone)
		phone = clean.homephone(phone)
	  search_results = repo.keep_if {|attendee| attendee.homephone == phone}
		puts search_results
	end

	def street(street)
		street = street.downcase
	  search_results = repo.keep_if {|attendee| attendee.street == street}
	  puts search_results
	end
end