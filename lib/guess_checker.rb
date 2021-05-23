class GuessChecker
attr_reader :guess, :answer

  def initialize(guess, answer)
    @guess = guess
    @answer = answer
  end

  def length_long(char)
    @guess.length > char
  end

  def length_short(char)
    @guess.length < char
  end

  def split
    @guess = @guess.split("")
    @guess
  end

  def all_caps
    @guess = @guess.map { |color| color.upcase }
  end

  def valid_colors(color)
    if color == 4
      valid_options = ['R', 'G', 'Y', 'B']
    elsif color == 5
      valid_options = ['R', 'G', 'Y', 'B', 'O']
    elsif color == 6
      valid_options = ['R', 'G', 'Y', 'B', 'O', 'P']
    end
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
    temp_answer = @answer.clone
    @guess.each do |gcolor|
      index = 0
      temp_answer.each do |acolor|
        if gcolor == acolor
          correct_colors += 1
          temp_answer[index] = 'X'
          break
        end
        index += 1
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
      end
      index += 1
    end
    correct_positions
  end
end
