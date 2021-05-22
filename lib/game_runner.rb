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
        difficulty_input
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

  def difficulty_input
    loop do
    @messages.difficulty_level_message
    input = gets.chomp
    if input == 'b' || input == 'B'
      difficulty_level(1)
    elsif input == 'i' || input == 'I'
      difficulty_level(2)
    elsif input == 'h' || input == 'H'
      difficulty_level(3)
    elsif input == 'q' || input == 'Q'
      break
    else
      puts 'Invalid input'
    end
  end

  def difficulty_level(level)
    if level == 1
      char = 4
      color = 4
    elsif level == 2
      char = 6
      color = 5
    elsif level == 3
      char = 8
      color = 6
    end
    setup(char, color)
  end

  def setup(char, color)
    @solution = @secret_answer.solution(char, color)
    @messages.starter_message(char, color)
    @timer = Time.now
    @guess_count = 0
    starter(char, color)
  end

  def starter(char, color)
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
        has_won = analyze(guess, char, color)
      end
    end
  end

  def analyze(guess, char, color)
    @guess_checker = GuessChecker.new(guess, @solution)
    @guess_checker.split
    @guess_checker.all_caps
    if valid_input(char, color) != false
     @guess_count += 1
     compare(guess)
    end
  end

  def valid_input(char, color)
    if @guess_checker.valid_colors(color) == false
      @messages.invalid_color_message
      false
    elsif @guess_checker.length_long(char) == true
      @messages.too_long_message
      false
    elsif @guess_checker.length_short(char) == true
      @messages.too_short_message
      false
    end
  end

  def compare(guess)
    colors = @guess_checker.correct_colors
    positions = @guess_checker.correct_positions
    elapsed_time = (Time.at(Time.now - @timer).utc.strftime("%M minutes and %S seconds"))
    if positions == 4
      @messages.player_wins_message(guess, @guess_count, elapsed_time)
      true
    else
      @messages.correct_guesses_message(@guess_count, guess, colors, positions)
    end
  end
end
