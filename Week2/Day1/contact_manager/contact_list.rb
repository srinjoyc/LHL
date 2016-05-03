#!/bin/bash
require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.

end

def duplicate? (term)
  arr=Contact.search(term)
  if(arr.empty?)
    return false
  end
  return true
end

command = ARGV[0]
command_argument = ARGV[1]

case command

  when "new"
    puts "Enter a name:"
    name=STDIN.gets.chomp
    while duplicate?(name)
      puts "Name is taken, please enter another name"
      name=STDIN.gets.chomp
    end
    puts "Enter an email:"
    email=STDIN.gets.chomp
    while duplicate?(email)
      puts "Email is taken, please enter another email"
      email=STDIN.gets.chomp
    end
    Contact.create(name,email)
    puts "Contact created!"

  when "list"

    Contact.all.each_with_index do |contact, index|
      if(index%5==4)
        puts "Press 1 for more "
        check=STDIN.gets.chomp
      end
      puts " Name: #{contact.name}, Email: #{contact.email} Numbers: #{contact.phone_numbers} "
    end
  when "show"
    puts "ID requested: #{command_argument}"
    puts "Contact Info:"
    contact = Contact.find(command_argument)
    puts " Name: #{contact.name}, Email: #{contact.email} "
  when "search"
    puts "Enter search term"
    term=STDIN.gets.chomp
    Contact.search(term).each { |contact| puts "Name: #{contact.name}, Email: #{contact.email}" }
  when "phone"
    Contact.phone
  else
    puts "Command not found"
end




