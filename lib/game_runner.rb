require './lib/guess_checker'
require './lib/secret_answer'
require './lib/messages'

class GameRunner

  def initialize
    @messages = Messages.new
    @secret_answer = SecretAnswer.new
  end

  def intro
    loop do
      @messages.welcome_message
      input = gets.chomp
      if input == 'p' || input == 'P'
        starter
      elsif input == 'i' || input == 'I'
        @messages.instructions_message
      elsif input == 'q' || input == 'Q'
        @messages.quit_message
        break
      else
        puts 'Invalid input'
      end
    end
  end

  def starter
    @guess_count = 0
    @solution = @secret_answer.solution
    has_won = false
    @messages.starter_message
    until has_won == true do
      @messages.prompt_guess_message
      guess = gets.chomp
      if guess == 'Q' || guess == 'q'
        @messages.quit_message
        break
      elsif guess == 'C' || guess == 'c'
        @messages.cheat_message(@solution)
        break
      else
        has_won = analyze(guess)
      end
    end
  end

  def analyze(guess)
    @guess_checker = GuessChecker.new(guess, @solution)
    @guess_checker.split
    @guess_checker.all_caps
    if valid_input != false
     @guess_count += 1
     compare(guess)
    end
  end

  def valid_input
    if @guess_checker.valid_colors == false
      @messages.invalid_color_message
      false
    elsif @guess_checker.length_long == true
      @messages.too_long_message
      false
    elsif @guess_checker.length_short == true
      @messages.too_short_message
      false
    end
  end

  def compare(guess)
    colors = @guess_checker.correct_colors
    positions = @guess_checker.correct_positions
    if positions == 4
      @messages.player_wins_message(guess, @guess_count, 111)
      true
    else
      @messages.correct_guesses_message(@guess_count, guess, colors, positions)
    end
  end
end
