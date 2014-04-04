class Contact

  attr_accessor :id, :first_name, :last_name, :email, :notes, :time_created

  def initialize(first_name, last_name, email, notes, time_created)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes.capitalize
    @time_created = time_created
  end
end