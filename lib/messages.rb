class Messages
  def welcome_message
    puts "\nWelcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def instructions_message
    file = File.open("./data/instructions.txt")
    instructions = file.read
    puts instructions
    file.close
  end

  def restart_message
    puts "\nWould you like to (p)lay again or (q)uit?\n"
  end

  def difficulty_level_message
    puts ""
    puts "-" * 20
    puts "What difficulty would you like to play? (or (q)uit)\n\n"
    puts "(b)eginner: 4 characters, 4 colors"
    puts "(i)ntermediate: 6 characters, 5 colors"
    puts "(h)ard: 8 characters, 6 colors\n"
    puts "-" * 20
    puts ""
  end

  def starter_message_beginner
    puts "\nI have generated a beginner sequence with 4 elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n"
  end

  def starter_message_intermediate
    puts "\nI have generated an intermediate sequence with 6 elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (o)range. Use (q)uit at any time to end the game.\n"
  end

  def starter_message_hard
    puts "\nI have generated a hard sequence with 8 elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range and (p)ink. Use (q)uit at any time to end the game.\n"
  end

  def prompt_guess_message
    puts "\nWhat's your guess? (or (q)uit)\n"
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

  def history_message(guess)
    puts "Guess #{guess[:guess_count]}: \'#{guess[:user_guess]}\', with #{guess[:correct_colors]} of the correct colors and #{guess[:correct_positions]} in the correct positions."
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
    puts "Guess #{guess_count}: \'#{guess}\' has #{color} of the correct colors with #{position} in the correct positions.\n"
    puts "-" * 20
  end
end
