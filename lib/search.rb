require_relative 'attendee_repo'
require_relative 'clean'

class Search
	attr_reader :repo, :attendees, :clean

	def initialize(queue)
		@repo = queue
		@clean = Clean.new
	end

	def first_name(name)
		name = name.downcase
		repo.select {|attendee| attendee.first_name.downcase == name }
	end

	def last_name(name)
		name = name.downcase
		repo.select {|attendee| attendee.last_name.downcase == name }
	end

	def zipcode(zipcode)
		clean.zipcode(zipcode)
		repo.select {|attendee| attendee.zipcode == zipcode }
	end

	def email(email)
		email = clean.email_address(email)
		repo.select {|attendee| attendee.email_address.downcase == zipcode }
	end

	def homephone(phone)
		phone = clean.homephone(phone)
	  repo.select {|attendee| attendee.homephone == phone }
	end

	def street(street)
		street = street.downcase
	  repo.select {|attendee| attendee.street.downcase == street }
	end

	def state(state)
		state = state.downcase
		repo.select {|attendee| attendee.state.downcase == state }
	end

	def city(city)
		city = city.downcase
		repo.select {|attendee| attendee.city.downcase == city }
	end
end
