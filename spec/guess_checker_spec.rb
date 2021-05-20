require 'rspec'
require './lib/guess_checker'

describe GuessChecker do
  before(:each) do
    @answer = ['R', 'B', 'G', 'Y']
    @guess_checker = GuessChecker.new('RGBY', @answer)
  end

  context 'Attributes' do
    it 'exists' do
      expect(@guess_checker).to be_a(GuessChecker)
    end

    it 'outputs parameters from arugments' do
      expect(@guess_checker.guess).to eq('RGBY')
    end
  end

  context 'is valid user input' do
    it 'with 4 characters' do
      expect(@guess_checker.length).to eq(true)

      @guess_checker = GuessChecker.new('RGBYRB', @answer)
      expect(@guess_checker.length).to eq(false)

      @guess_checker = GuessChecker.new('RG', @answer)
      expect(@guess_checker.length).to eq(false)
    end

    it 'splits the guess' do
      expect(@guess_checker.split).to eq(['R', 'G', 'B', 'Y'])
    end

    it 'with valid colors' do
      @guess_checker.split
      expect(@guess_checker.valid_colors).to eq(true)

      @guess_checker = GuessChecker.new('FZBY', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors).to eq(false)

      @guess_checker = GuessChecker.new('BYFZ', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors).to eq(false)
    end
  end

  context 'compares guess to correct answer' do
    it 'determines number of correct colors' do
      @guess_checker.split
      expect(@guess_checker.correct_colors).to eq(4)

      @answer = ['R', 'G', 'G', 'B']
      @guess_checker = GuessChecker.new('RRYY', @answer)
      @guess_checker.split
      expect(@guess_checker.correct_colors).to eq(1)

      @answer = ['R', 'R', 'R', 'R']
      @guess_checker = GuessChecker.new('GGYY', @answer)
      @guess_checker.split
      expect(@guess_checker.correct_colors).to eq(0)
    end

    it 'determines number of correct positions' do
      @guess_checker.split
      expect(@guess_checker.correct_positions).to eq(2)
    end
  end
end
