class Messages
  def welcome_message
    puts "\nWelcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def instructions_message
    file = File.open("./lib/intructions.txt")
    instructions = file.read
    puts instructions
    file.close
  end

  def starter_message
    puts "\nI have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n"
  end

  def prompt_guess_message
    puts "\nWhat's your guess?\n"
  end

  def too_long_message
    puts "\nXXX You have entered an invalid answer. Answer is too long! XXX\n"
  end

  def too_short_message
    puts "\nXXX You have entered an invalid answer. Answer is too short! XXX\n"
  end

  def player_wins_message(guess, numbers, time)
    puts ""
    puts "-" * 20
    puts "Congratulations! You guessed the sequence #{guess} in #{numbers} guesses in #{time}.\n"
    puts "-" * 20
  end

  def cheat_message(secret_answer)
    puts ""
    puts "-" * 20
    puts "You have chosen to take the easy way out. Here is the #{secret_answer}.\n"
    puts "-" * 20
  end

  def player_loses_message
    puts "\nGAME OVER!\n"
  end

  def invalid_color_message
    puts "\nXXX You have entered an invalid color. Please try again! XXX\n"
  end

  def quit_message
    puts "\nThank you for playing Mastermind, created by Lee and Ezze.\n\n"
  end

  def correct_guesses_message(guess_count, guess, color, position)
    puts ""
    puts "-" * 20
    puts "Guess #{guess_count}: \'#{guess}\' has #{color} of the correct elements with #{position} in the correct positions.\n"
    puts "-" * 20
  end
end
