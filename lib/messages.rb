class Messages
  def welcome_message
    puts "Welcome to MASTERMIND. \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions_message
    file = File.open("./lib/intructions.txt")
    instructions = file.read
    puts instructions
    file.close
  end

  def secret_answer_message
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat’s your guess?"
  end

  def too_long_message
    puts "You have entered an invalid answer. Answer is too long!"
  end

  def too_short_message
    puts "You have entered an invalid answer. Answer is too short!"
  end

  def player_wins_message(guess, numbers, time)
    puts "Congratulations! You guessed the sequence #{guess} in #{numbers} over #{time}.\n\nDo you want to (p)lay again or (q)uit?"
  end

  def cheat_message(secret_answer)
    puts "You have chosen to take the easy way out. Here is the #{secret_answer}."
  end

  def player_loses_message
    puts "GAME OVER!"
  end

  def invalid_color_message
    puts "You have entered an invalid color. Please try again!"
  end

  def quit_message
    puts "Thank you for playing Mastermind, created by Lee and Ezze"
  end

  def correct_guesses_message(guess, color, position)
    puts "\'#{guess}\' has #{color} of the correct elements with #{position} in the correct positions"
    puts "You've taken ADD GUESS COUNT"
  end

end
