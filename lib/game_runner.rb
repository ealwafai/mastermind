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
        break
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
    solution = @secret_answer.solution
    loop do
      @messages.secret_answer_message
      input = gets
      if input == 'Q' || input == 'q'
        @messages.quit_message
        break
      elsif input == 'C' || input == 'c'
        @messages.cheat_message
        break
      else
        @guess_checker = GuessChecker.new(input, solution)
        @guess_checker.split
        valid_input
        if valid_input == true
          compare
          break
        end
      end
    end
  end

  def valid_input
    valid = true
    if @guess_checker.length_short == true
      @messages.too_short_message
      valid = false
    elsif @guess_checker.length_long == true
      @messages.too_long_message
      valid = false
    elsif @guess_checker.valid_colors == false
      @messages.invalid_color_message
      valid = false
    end
    valid
  end

  def compare
    
  end
end
