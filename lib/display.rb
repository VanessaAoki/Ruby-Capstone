class Display
  def welcome
    "Welcome! I'm here to help you find anything you need from wikipedia."
  end

  def request_terms
    [
    "Please enter the terms of your search:\n"
    ]
  end

  def invalid_terms
    [
    "Oops, looks like you didn't type anything. Try again!\n"
    ]
  end

  def continue_article
    [
    "\nDo you want to read the whole article? [Y]es or [N]o\n"
    ]
  end

  def invalid_continue
    [
    "That's not a valid input, please select [Y]es or [N]o."
    ]
  end

  def fetch_again
    [
    "\nWhat would you like to do next?
(type the wanted option 1 or 2)
1 - Make another search.
2 - Quit the program.\n"
    ]
  end

  def invalid_again
    [
    "That's not a valid input, please try again.
Select your options by typing 1 or 2.\n"
    ]
  end

  def goodbye
    [
    'Thanks for using the program! Hope to see you again.'
    ]
  end
end
