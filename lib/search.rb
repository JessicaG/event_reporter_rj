require_relative 'attendee_repo'
require_relative 'clean'

class Search
attr_reader :clean
attr_accessor :attendees

	def initialize(attendees)
		@attendees = attendees
		@clean = Clean.new
	end

	def first_name(name)
		#print attendees
		name = name.downcase
		attendees.keep_if {|attendee| attendee.first_name.downcase == name }
	end

	def last_name(name)
		name = name.downcase
		attendees.keep_if {|attendee| attendee.last_name.downcase == name }
	end

	def zipcode(zipcode)
		clean.zipcode(zipcode)
		attendees.keep_if {|attendee| attendee.zipcode == zipcode }
	end

	def email(email)
		email = clean.email_address(email)
		attendees.keep_if {|attendee| attendee.email_address.downcase == email }
	end

	def homephone(phone)
		phone = clean.homephone(phone)
	  attendees.keep_if {|attendee| attendee.homephone == phone }
	end

	def street(street)
		street = street.downcase
	  attendees.keep_if {|attendee| attendee.street.downcase == street }
	end

	def state(state)
		state = state.downcase
		attendees.keep_if {|attendee| attendee.state.downcase == state }
	end

	def city(city)
		city = city.downcase
		attendees.keep_if {|attendee| attendee.city.downcase == city }
	end
end
