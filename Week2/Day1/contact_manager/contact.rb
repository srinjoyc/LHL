#!/bin/bash
require 'csv'
require 'pry'
# Represents a person in an address book.
# The ContactList class will work with Contact objects instead of interacting with the CSV file directly
FILE_NAME = "contacts.csv"

class Contact

  attr_accessor :name, :email, :phone_numbers

  # Creates a new contact object
  # @param name [String] The contact's name
  # @param email [String] The contact's email address
  def initialize(name, email, phone)
    # TODO: Assign parameter values to instance variables.
    @name=name
    @email=email
    @phone_numbers=phone
  end

  # Provides functionality for managing contacts in the csv file.
  class << self

    # Opens 'contacts.csv' and creates a Contact object for each line in the file (aka each contact).
    # @return [Array<Contact>] Array of Contact objects
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
      contacts= []
      CSV.foreach(FILE_NAME) do |row|
        contact= Contact.new(row[1],row[2],row[3])
        contacts << contact
      end
      return contacts
    end

    def get_id
      Contact.all.size+1
    end
    def get_phone_number
      puts "Do you want to add a number? 0 = no, 1 = yes"
      input=STDIN.gets.chomp.to_i
      numbers=[]
      while (input == 1)
        puts "What type of phone number?"
        type = STDIN.gets.chomp
        puts "Enter a phone number:"
        number = STDIN.gets.chomp
        string= "#{type}: #{number}"
        numbers.push(string)
        puts "Add another?"
        input=STDIN.gets.chomp.to_i
      end
      return numbers
    end
    # Creates a new contact, adding it to the csv file, returning the new contact.
    # @param name [String] the new contact's name
    # @param email [String] the contact's email
    def create(name, email)
      id=get_id
      numbers = get_phone_number
      contact=Contact.new(name,email,numbers)
      CSV.open(FILE_NAME, "a") do |row|
        row << [id ,contact.name,contact.email, numbers]
      end
      return contact
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
    end

    # Find the Contact in the 'contacts.csv' file with the matching id.
    # @param id [Integer] the contact id
    # @return [Contact, nil] the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      contact=nil
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
      CSV.foreach(FILE_NAME) do |row|
        if row[0] == id
          contact = Contact.new(row[1],row[2], row[3])
        end
      end
      return contact
    end

    # Search for contacts by either name or email.
    # @param term [String] the name fragment or email fragment to search for
    # @return [Array<Contact>] Array of Contact objects.
    def search(term)
      search_array=Contact.all
      search_array.select do |contact|
        contact.name.include?(term) || contact.email.include?(term)
      end
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    end

    def phone
      puts "Enter a number"
      phone_number = STDIN.gets.chomp
      puts "Which contact, select index"
      #Contact.all.each_with_index {|contact, index| puts "Name: #{contact.name}, Index: #{index}" }
      CSV.foreach(FILE_NAME) do |row|
        puts row.inspect
      end
      sel_index=STDIN.gets.chomp
      add_val(Contact.find(sel_index), phone_number)
      end
    end
end




