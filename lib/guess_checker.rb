class GuessChecker
attr_reader :guess

  def initialize(guess)
    @guess = guess
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
end
