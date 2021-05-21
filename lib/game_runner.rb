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
    @solution = @secret_answer.solution
    @has_won == false
    until @has_won == true do
      @messages.secret_answer_message
      @og_guess = gets.chomp
      if @og_guess == 'Q' || @og_guess == 'q'
        @messages.quit_message
        break
      elsif @og_guess == 'C' || @og_guess == 'c'
        @messages.cheat_message(@solution)
        break
      else
        @guess_checker = GuessChecker.new(@og_guess, @solution)
        @guess_checker.split
        @guess_checker.all_caps
        valid_input
        if @valid == true
          compare
        end
      end
    end
  end

  def valid_input
    @valid = true
    if @guess_checker.length_short == true
      @messages.too_short_message
      @valid = false
    elsif @guess_checker.length_long == true
      @messages.too_long_message
      @valid = false
    elsif @guess_checker.valid_colors == false
      @messages.invalid_color_message
      @valid = false
    end
    @valid
  end

  def compare
    colors = @guess_checker.correct_colors
    positions = @guess_checker.correct_positions
    if positions == 4
      @messages.player_wins_message(@og_guess, "0 guesses", 111)
      @has_won = true
    else
      @messages.correct_guesses_message(@og_guess, colors, positions)
    end
  end
end
