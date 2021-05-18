require 'rspec'
require './lib/guess'

describe Guess do
  before(:each) do
    @guess = Guess.new('RGBY')
  end

  context 'Attributes' do
    it 'exists' do
      expect(@guess).to be_an_instance_of(Guess)
    end
  end
end
