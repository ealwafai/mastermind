class SecretAnswer

  attr_reader :answer
  def initialize
  end

  def solution
    @answer = []
    colors = [:red, :blue, :yellow, :green]
    4.times do
      index = rand(0..3)
      @answer << colors[index]
    end
    @answer
  end
end
