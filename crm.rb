require_relative "contact.rb"
class CRM
  @@contacts=[]
  def initialize
       contact1=Contact.new('Parker', 'Johnston', 'pj@email.com', 'dude')
       contact2=Contact.new('Jane', 'Smith', 'js@email.com', 'gal')
       contact3=Contact.new('Bill', 'Steel', 'bs@email.com', 'bro')
       contact4=Contact.new('Mary', 'Doe', 'md@email.com', 'lady')
       @@contacts << contact1
       @@contacts << contact2
       @@contacts << contact3
       @@contacts << contact4
  end


  attr_reader :first_name
  attr_reader :last_name
  attr_accessor :email
  attr_accessor :note

  def main_menu
    while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '

  end

  def call_option(user_selected)
  case user_selected
  when 1 then contact=add_new_contact #done
  when 2 then modify_existing_contact #unfinished
  when 3 then delete_contact #done
  when 4 then display_all_contacts #done
  when 5 then search_by_attribute #done
  when 6 then quit #not working
  end

  end


  def add_new_contact
    puts 'Enter First Name: '
      first_name = gets.chomp

    puts 'Enter Last Name: '
      last_name = gets.chomp

    puts 'Enter Email Address: '
      email = gets.chomp

    puts 'Enter a Note: '
      note = gets.chomp

    contact=Contact.new(first_name, last_name, email, note)
    @@contacts << contact

    end

  def modify_existing_contact
    puts 'Update First Name: '
      first_name = gets.chomp

    puts 'Update Last Name: '
      last_name = gets.chomp

    puts 'Update Email Address: '
      email = gets.chomp

    puts 'Update contact Note: '
      note = gets.chomp

  end

  def delete_contact
    puts "Enter email of contact to delete:"
    input = gets.chomp
     @@contacts.each do |contact|
       if contact.email == input
          @@contacts.delete(contact)
        else
       end
     end

  end

  def display_all_contacts
      puts "Contacts:"
    @@contacts.each do |contact|
      puts contact.full_name
    end
    puts "End of Contacts list."
  end

  def search_by_attribute
    puts "Enter attribute of contact to display:"
    input = gets.chomp
    puts "Contacts found:"
     @@contacts.each do |contact|
       if contact.first_name == input
         puts contact.full_name
       elsif contact.last_name == input
          puts contact.full_name
       elsif contact.email == input
          puts contact.full_name
       elsif contact.note == input
          puts contact.full_name
       else
       end

  end

  def quit
    quit
  end

end

end

crm2 = CRM.new
crm2.main_menu
