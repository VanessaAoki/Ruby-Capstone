class Display
  def welcome
    puts "Welcome! I'm here to help you find anything you need from wikipedia."
  end

  def request_terms
    puts "Please enter the terms of your search:\n"
  end

  def invalid_article
    puts "Oops, looks like we can't find the mentioned article.
Please, try again:\n"
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

  def again?
    puts "\n
    Great choice, what would you like to do next?
(type the wanted option 1 - 3)
1 - Make another research, with other terms.
2 - Make another research with the same terms.
3 - Quit the program.\n"
  end

  def invalid_continue
    puts "That's not a valid input, please try again.
Select your options by typing 1, 2 or 3.\n"
  end

  def goodbye
    puts 'Thanks for using the program! Hope to see you again.'
  end
end
