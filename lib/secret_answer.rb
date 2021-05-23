class SecretAnswer

  attr_reader :answer
  def initialize
  end

  def solution(char, color)
    answer = []
    if color == 4
      colors = ['R', 'G', 'Y', 'B']
    elsif color == 5
      colors = ['R', 'G', 'Y', 'B', 'O']
    elsif color == 6
      colors = ['R', 'G', 'Y', 'B', 'O', 'P']
    end
    char.times do
      index = rand(0..(color - 1))
      answer << colors[index]
    end
    answer
  end
end
