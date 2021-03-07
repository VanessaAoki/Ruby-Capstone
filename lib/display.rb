class Display
  def welcome
    puts "Welcome! I'm here to help you find anything you need from wikipedia."
  end

  def request_terms
    puts "Please enter the terms of your search:\n"
  end

  def invalid_terms
    puts "Oops, looks like you didn't type anything. Try again!\n"
  end

  def continue_article
    puts "\nDo you want to read the whole article? [Y]es or [N]o\n"
  end

  def invalid_continue
    puts "That's not a valid input, please select [Y]es or [N]o."
  end

  def select_main
    puts "Please select one of the following options:
1 - Today's featured article;
2 - In the news;
3 - Did you know...;
4 - On this day."
  end

  def invalid_main
    puts "That's not a valid input, please try again.
Select your options by typing 1, 2, 3 or 4.\n"
  end

  def fetch_again
    puts "\nWhat would you like to do next?
(type the wanted option 1 or 2)
1 - Make another search.
2 - Quit the program.\n"
  end

  def invalid_again
    puts "That's not a valid input, please try again.
Select your options by typing 1, 2 or 3.\n"
  end

  def goodbye
    puts 'Thanks for using the program! Hope to see you again.'
  end
end
