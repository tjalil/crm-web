class Contacts

  attr_accessor :id, :first_name, :last_name, :email, :notes, :time_created

  def initialize(first_name, last_name, email, notes, time_created)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    @time_created = time_created
  end

end