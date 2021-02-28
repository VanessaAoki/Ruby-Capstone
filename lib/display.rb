module Display
  def welcome
    puts "Welcome! I'm here to help you find anything you need from wikipedia."
  end

  def search_term
    puts "Please enter the terms of your search: "
  end

  def invalid_input
    puts "I'm sorry, that's an invalid input... Please, try again."
  end

  def page_options
    puts "These are the available pages on Wikipedia.
    Please, type your chosen:
    \n"
  end

  def invalid_page
    puts "Oops, looks like we can't find the mentioned page.
    Please, try again:
    \n"
  end

  def again?
    puts "\n
    Great choice, what would you like to do next? 
    (type the wanted option 1 - 3)
    1 - Make another research, with other terms.
    2 - Make another research with the same terms.
    3 - Quit the program.
    \n"
  end

  def invalid_continue
    puts "That's not a valid input, please try again.
    Select your options by typing 1, 2 or 3."
  end
  
  def goodbye
    puts "Thanks for using the program! Hope to see you again."
  end
end