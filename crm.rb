require_relative "contact.rb"

class CRM

  def initialize
    contact1=Contact.create('Parker', 'Johnston', 'pj@email.com', 'dude')
    contact2=Contact.create('Jane', 'Smith', 'js@email.com', 'gal')
    contact3=Contact.create('Bill', 'Steel', 'bs@email.com', 'bro')
    contact4=Contact.create('Mary', 'Doe', 'md@email.com', 'lady')

    @run = true
    @modding = true

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
    when 6 then @run = false
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
    puts "Enter id number of contact to be modified"
    input = gets.to_i


    if Contact.find_by_id(input) == false
      puts "Contact not found."
    else

      puts "Which attribute would you like to update?"
      puts "[1] First name"
      puts "[2] Last name"
      puts "[3] Email address"
      puts "[4] Note"
      puts "[5] Cancel"

      modrequest = gets.to_i

      case modrequest
      when 1 then attribute = 1
      when 2 then attribute = 2
      when 3 then attribute = 3
      when 4 then attribute = 4
      end

      puts "Enter updated information:"
          value = gets.chomp

      Contact.find_by_id(input).modify_selected_contact(attribute, value)
    end
  end


  def delete_contact
    puts "Enter id number or email of contact to be deleted:"
    Contact.delete_contact
      puts "Contact deleted."
  end

  def display_all_contacts
      puts "~ ~ ~ ~ ~ ~ ~ ~"
      puts "Contacts:"
      Contact.print_all_contacts
      puts "End of Contacts list."
      puts "~ ~ ~ ~ ~ ~ ~ ~"
  end

  def search_by_attribute
    puts "Enter a contact's id, first name, last name or other stored info:"
    Contact.find_by_anything
    puts "~ ~ ~ ~ ~ ~ ~ ~"
  end



end

crm2 = CRM.new
crm2.main_menu
