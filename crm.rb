require_relative "contact.rb"

class CRM

  def initialize
    contact1=Contact.create('Parker', 'Johnston', 'pj@email.com', 'dude')
    contact2=Contact.create('Jane', 'Smith', 'js@email.com', 'gal')
    contact3=Contact.create('Bill', 'Steel', 'bs@email.com', 'bro')
    contact4=Contact.create('Mary', 'Doe', 'md@email.com', 'lady')

    @run = true

  end

  def main_menu
    while @run == true # repeat indefinitely
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
    when 6 then quit #done
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

    contact=Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    contact_to_modify = find_contact
    if contact_to_modify
      puts "Need method to present attribute to modify"
    end
  end

  # def find_by_email
  #   puts "Enter email of contact to find:"
  #   input = gets.chomp
  #    @@contacts.each do |contact|
  #      if contact.email == input
  #         return contact
  #      end
  #    end
  #    return false
  # end

  def find_contact
    puts "Enter id of contact to find:"
    id = gets.chomp
    contact = Contact.find(id)
  end

  def delete_contact
    contact_to_delete = find_contact
    if contact_to_delete
      contact_to_delete.delete
      puts "Contact deleted."
    else
      puts "Contact not found."
    end
  end

  def display_all_contacts
      puts "Contacts:"
      Contact.print_all_contacts
    puts "End of Contacts list."
  end

  def search_by_attribute
    puts "Enter a contact's first name, last name or other stored info:"
    input = gets.chomp
    Contact.find_by
    puts "Contacts found:"

  end

  def quit
    @run = false
    main_menu
  end

end

crm2 = CRM.new
crm2.main_menu
