require 'rspec'
require './lib/secret_answer'

describe SecretAnswer do
  context 'Attributes' do
    it 'it exists' do
      secret_answer = SecretAnswer.new

      expect(secret_answer).to be_an_instance_of(SecretAnswer)
    end
  end 
end
