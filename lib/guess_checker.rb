class GuessChecker
attr_reader :guess, :answer

  def initialize(guess, answer)
    @guess = guess
    @answer = answer
  end

  def length
    @guess.length == 4
  end

  def split
    @guess = @guess.split("")
    @guess
  end

  def valid_colors
    valid_options = ['R', 'B', 'G', 'Y']
    result = true
    @guess.each do |color|
      if !valid_options.include?(color)
        result = false
      end
    end
    result
  end

  def correct_colors
    correct_colors = 0
    index = 0
    @guess.each do |color|
      @answer.find do |color|
        correct_colors += 1
        @answer.shift[index]
      end
      index += 1
    end
    correct_colors
  end
end
