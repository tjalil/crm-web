class Rolodex
  attr_reader :contacts

  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, notes, created_at)
    contact = Contact.new(first_name, last_name, email, notes, created_at)
    contact.id = Rolodex.get_id
    @contacts << contact
  end

  def find(contact_id)
    @contacts.find do |contact|
      contact.id == contact_id
    end
  end

  def remove_contact(contact)
    @contacts.delete(contact)
  end

  def self.get_id
    @@id += 1
  end

end