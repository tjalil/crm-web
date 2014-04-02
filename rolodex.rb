class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    contact.time_created = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
    @contacts << contact
    @id += 1
  end

  def get_user_id(contact)
    @contacts.each do |contact|
      if contact.id == @id
        #do something
      end
    end
  end

  def remove_contact(contact)
    contact.id = @id
  end

end