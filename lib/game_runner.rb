require './lib/guess_checker'
require './lib/secret_answer'
require './lib/messages'

class GameRunner

  def initialize
    @messages = Messages.new
    @secret_answer = SecretAnswer.new
    @guess_checker = GuessChecker.new
  end

  def starter
    loop do
      messages.welcome_message
      user_input = gets.chomp
      if user_input == 'p' || user_input == 'P'
        runner
        break
      elsif user_input == 'i' || user_input == 'I'
        messages.instructions_message
      elsif user_input == 'q' || user_input == 'Q'
        messages.quit_message
        break
      else
        puts 'Invalid input'
      end
    end
  end


end