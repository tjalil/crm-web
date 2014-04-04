class Rolodex
  attr_reader :contacts

  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, notes, time_created)
    contact = Contact.new(first_name, last_name, email, notes, time_created)
    contact.id = Rolodex.get_id
    contact.time_created = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
    @contacts << contact
  end

  def find(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id
    end
  end

  def remove_contact(contact)
    contact.id = @id
  end

  def self.get_id
    @@id += 1
  end

end