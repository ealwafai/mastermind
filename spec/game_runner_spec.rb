require 'rspec'
require './lib/game_runner'

describe GameRunner do
  it 'exists' do
    gamerunner = GameRunner.new

    expect(gamerunner).to be_a(GameRunner)
  end
end
