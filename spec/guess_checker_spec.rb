require 'rspec'
require './lib/guess'

describe GuessChecker do
  before(:each) do
    @guess = GuessChecker.new('RGBY')
  end

  context 'Attributes' do
    it 'exists' do
      expect(@guess).to be_a(GuessChecker)
    end
  end
end
