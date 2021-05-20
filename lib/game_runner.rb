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
      @guess_checker = GuessChecker.new(input, solution)
      if @guess_checker.length_short == true
        @messages.too_short_message
      elsif @guess_checker.length_long == true
        @messages.too_long_message
      elsif @guess_checker.valid_colors == false
        @messages.invalid_color_message
      else
        tester
        break
      end
    end
  end
end
