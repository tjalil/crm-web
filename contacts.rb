class Contacts

  attr_accessor :first_name, :last_name, :email, :job_description, :notes

  def initialize(first_name, last_name, email, job_description, notes)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @job_description = job_description
    @notes = notes
  end

end