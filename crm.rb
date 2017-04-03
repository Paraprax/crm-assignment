require_relative "contact.rb"
class CRM
  @@contacts=[]
  def initialize
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
    puts '[6] Display contact full name'
    puts '[7] Exit'
    puts 'Enter a number: '

  end

  def full_name(contact)
    #puts "Contact's full name is #{full_name}"
    @@contacts.each do |contact|
      puts contact.full_name
    end
  end

  def call_option(user_selected)
  case user_selected
  when 1 then contact=add_new_contact
  when 2 then modify_existing_contact
  when 3 then delete_contact
  when 4 then display_all_contacts
  when 5 then search_by_attribute
  when 6 then full_name(contact)
  when 7 then quit
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

    modify = Contact.modify_existing_contact

  end

  def delete_contact
    puts "Enter email of contact to delete:"
  end

  def display_all_contacts
    puts "All contacts:"
    puts @@contacts
  end

  def search_by_attribute

  end



end

crm2 = CRM.new
crm2.main_menu
