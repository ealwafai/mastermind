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

      expect(@guess_checker.length_long(4)).to eq(false)
      expect(@guess_checker.length_short(4)).to eq(false)

      @guess_checker = GuessChecker.new('RGBYRB', @answer)
      expect(@guess_checker.length_long(4)).to eq(true)

      @guess_checker = GuessChecker.new('RG', @answer)
      expect(@guess_checker.length_short(4)).to eq(true)
    end

    it 'with 6 characters' do
      @answer = ['R', 'B', 'G', 'Y', 'O', 'R']
      @guess_checker = GuessChecker.new('RGBYRR', @answer)

      expect(@guess_checker.length_long(6)).to eq(false)
      expect(@guess_checker.length_short(6)).to eq(false)

      @guess_checker = GuessChecker.new('RGBYRBRR', @answer)
      expect(@guess_checker.length_long(6)).to eq(true)

      @guess_checker = GuessChecker.new('RGRR', @answer)
      expect(@guess_checker.length_short(6)).to eq(true)
    end

    it 'with 8 characters' do
      @answer = ['R', 'B', 'G', 'Y', 'O', 'P', 'G', 'B']
      @guess_checker = GuessChecker.new('RGBYOOOO', @answer)

      expect(@guess_checker.length_long(8)).to eq(false)
      expect(@guess_checker.length_short(8)).to eq(false)

      @guess_checker = GuessChecker.new('RGBYRBRRR', @answer)
      expect(@guess_checker.length_long(8)).to eq(true)

      @guess_checker = GuessChecker.new('RGRRRR', @answer)
      expect(@guess_checker.length_short(8)).to eq(true)
    end

    it 'splits the guess' do
      expect(@guess_checker.split).to eq(['R', 'G', 'B', 'Y'])
    end

    it 'converts to all caps' do
      @guess_checker = GuessChecker.new('rgby', @answer)
      @guess_checker.split
      @guess_checker.all_caps

      expect(@guess_checker.guess).to eq(['R', 'G', 'B', 'Y'])

      @guess_checker = GuessChecker.new('RGby', @answer)
      @guess_checker.split
      @guess_checker.all_caps

      expect(@guess_checker.guess).to eq(['R', 'G', 'B', 'Y'])

    end

    it 'with 4 valid colors' do
      @guess_checker.split
      expect(@guess_checker.valid_colors(4)).to eq(true)

      @guess_checker = GuessChecker.new('FZBY', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(4)).to eq(false)

      @guess_checker = GuessChecker.new('BYFZ', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(4)).to eq(false)
    end

    it 'with 5 valid colors' do
      @answer = ['R', 'B', 'G', 'Y', 'O', 'R']
      @guess_checker = GuessChecker.new('RGBYOR', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(5)).to eq(true)

      @guess_checker = GuessChecker.new('FZBYOG', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(5)).to eq(false)

      @guess_checker = GuessChecker.new('BYFZOG', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(5)).to eq(false)
    end

    it 'with 6 valid colors' do
      @answer = ['R', 'B', 'G', 'Y', 'O', 'R', 'G', 'B']
      @guess_checker = GuessChecker.new('RGBYORGB', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(6)).to eq(true)

      @guess_checker = GuessChecker.new('FZBYOPGB', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(6)).to eq(false)

      @guess_checker = GuessChecker.new('BYFZOPGB', @answer)
      @guess_checker.split
      expect(@guess_checker.valid_colors(6)).to eq(false)
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

      @answer = ['R', 'R', 'R', 'R']
      @guess_checker = GuessChecker.new('GGYY', @answer)
      @guess_checker.split
      expect(@guess_checker.correct_positions).to eq(0)

      @answer = ['R', 'B', 'Y', 'R']
      @guess_checker = GuessChecker.new('RBYR', @answer)
      @guess_checker.split
      expect(@guess_checker.correct_positions).to eq(4)
    end
  end
end
