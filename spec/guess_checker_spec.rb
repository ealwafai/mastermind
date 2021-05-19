require 'rspec'
require './lib/guess_checker'

describe GuessChecker do
  before(:each) do
    @guess_checker = GuessChecker.new('RGBY')
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

      @guess_checker = GuessChecker.new('RGBYRB')
      expect(@guess_checker.length).to eq(false)

      @guess_checker = GuessChecker.new('RG')
      expect(@guess_checker.length).to eq(false)
    end

    it 'splits the guess' do
      expect(@guess_checker.split).to eq(['R', 'G', 'B', 'Y'])
    end

    it 'with valid colors' do
      @guess_checker.split
      expect(@guess_checker.valid_colors).to eq(true)

      @guess_checker = GuessChecker.new('FZBY')
      @guess_checker.split
      expect(@guess_checker.valid_colors).to eq(false)

      @guess_checker = GuessChecker.new('BYFZ')
      @guess_checker.split
      expect(@guess_checker.valid_colors).to eq(false)
    end

  end
end
