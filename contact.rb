class Contact

  # Class variables and methods

  @@contacts = []
  @@id = 1

  def self.create(first_name, last_name, email, note)
    contact=Contact.new(first_name, last_name, email, note)
    @@contacts << contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
         contact
      end
    end
  end


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
        input = gets.chomp
            puts "Contacts found:"
    @@contacts.each do |contact|
      if contact.first_name == input
        puts contact.print_contact
      elsif contact.last_name == input
         puts contact.print_contact
      elsif contact.email == input
         puts contact.print_contact
      elsif contact.note == input
         puts contact.print_contact
      else
      end
    end
  end

  def self.find(input)
    @@contacts.each do |contact|
      if contact.email == input
        return contact
      end
    end
    return false
  end


  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end


  # Instance variables and methods

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :note
  attr_reader :id

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
  end

  def full_name
    puts "#{first_name} #{last_name}"
  end

  def print_contact
    puts "#{self.first_name} #{self.last_name}, #{self.email}, note: #{self.note}"
  end

  def self.print_all_contacts
    @@contacts.each do |contact|
      puts "#{contact.first_name} #{contact.last_name}, #{contact.email}, note: #{contact.note}"
    end
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here

  def delete
    @@contacts.delete(self)
    return true
  end

  # Feel free to add other methods here, if you need them.

end
