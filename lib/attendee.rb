class Attendee
  def self.build(row)
    clean = Clean.new
    new(row, clean)
  end

  attr_reader :id,
              :regdate,
              :first_name,
              :last_name,
              :email_address,
              :homephone,
              :street,
              :city,
              :state,
              :zipcode

  def initialize(row, clean)
    @id             = row[:id]
    @regdate        = row[:regdate]
    @first_name     = clean.first_name(row[:first_name])
    @last_name      = clean.last_name(row[:last_name])
    @email_address  = clean.email_address(row[:email_address])
    @homephone      = clean.homephone(row[:homephone])
    @street         = clean.street(row[:street])
    @city           = clean.city(row[:city])
    @state          = clean.state(row[:state])
    @zipcode        = clean.zipcode(row[:zipcode])
  end


end
