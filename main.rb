# frozen_string_literal: true

def main
  show_menu
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end

def show_menu
  puts 'Welcome to the Rice Cooker!'
  loop do
    display_options
    handle_user_choice(user_choice)
  end
end

def display_options
  puts 'Choose an option:'
  puts '1. Cook rice'
  puts '2. Keep warm'
  puts '3. Automatic shut-off after cooking'
  puts '4. Quit'
end

def handle_user_choice(choice)
  case choice
  when 1 then cook_rice
  when 2 then keep_warm
  when 3 then automatic_shutdown
  when 4
    puts 'Goodbye!'
    exit
  else
    puts 'Invalid option. Please select a valid option.'
  end
end

def user_choice
  print 'Enter the number of your choice: '
  gets.chomp.to_i
end

def cook_rice
  puts 'Cooking rice...'
  # Actual logic for cooking rice
  puts 'Rice is cooked!'
  return_to_menu
end

def keep_warm
  puts 'Keeping warm activated.'
  # Actual logic for keeping warm
  puts 'Keeping warm in progress...'
  return_to_menu
end

def automatic_shutdown
  puts 'Automatic shut-off after cooking.'
  # Actual logic for automatic shutdown
  puts 'Turning off the rice cooker.'
  return_to_menu
end

def return_to_menu
  puts 'Press any key to return to the main menu...'
  gets.chomp
end

main
