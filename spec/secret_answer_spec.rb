require 'rspec'
require './lib/secret_answer'

describe SecretAnswer do
  context 'Attributes' do
    it 'it exists' do
      secret_answer = SecretAnswer.new

      expect(secret_answer).to be_an_instance_of(SecretAnswer)
    end

    it 'it creates array with 4 colors' do
      secret_answer = SecretAnswer.new

      expect(secret_answer.solution.length).to eq(4)
      expect(secret_answer.solution).to include(:red).or include(:blue).or include(:yellow).or include(:green)
    end
  end
end
