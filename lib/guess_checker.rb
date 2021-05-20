class GuessChecker
attr_reader :guess, :answer

  def initialize(guess, answer)
    @guess = guess
    @answer = answer
  end

  def length_long
    @guess.length > 4
  end

  def length_short
    @guess.length < 4
  end

  def split
    @guess = @guess.split("")
    @guess
  end

  def all_caps
    @guess = @guess.map { |color| color.upcase }
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
    temp_answer = @answer
    @guess.each do |gcolor|
      index = 0
      temp_answer.each do |acolor|
        if gcolor == acolor
          correct_colors += 1
          temp_answer[index] = 'X'
          index += 1
          break
        end
      end
    end
    correct_colors
  end

  def correct_positions
    correct_positions = 0
    index = 0
    @guess.each do |color|
      if color == @answer[index]
        correct_positions += 1
        index += 1
      end
    end
    correct_positions
  end
end
