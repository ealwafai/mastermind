class SecretAnswer

  attr_reader :answer
  def initialize
  end

  def solution
    @answer = []
    colors = ['R', 'G', 'Y', 'B']
    4.times do
      index = rand(0..3)
      @answer << colors[index]
    end
    @answer
  end
end
