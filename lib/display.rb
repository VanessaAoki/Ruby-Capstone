module Display
  def welcome
    puts "Welcome! I'm here to help you find your guitar tabs from your favorite artists."
  end
  def artist_name
    puts "Please enter the artist or band name to start the search"
  end
  def invalid_input
    puts "I'm sorry, that's an invalid input... Please, try again."
  end
  def artist_options
    puts "These are the available artists options.
    Please, type your chosen artist:
    \n"
  end
  def invalid_artist
    puts "Oops, looks like we can't find the mentioned artist.
    Please, try again:
    \n"
  end
  def song_options
    puts "There are the song tabs for the chosen artist.
    Please, type the chosen song to display the tab:
    \n"
  end
  def invalid_song
    puts "Oops, looks like we can't find the requested tab.
    Please, try again:
    \n"
  end
  def again?
    puts "\n
    Great choice, what would you like to do next? 
    (type a number from 1 - 3)
    1 - Search for another artist?
    2 - Search for a song of the same artist?
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