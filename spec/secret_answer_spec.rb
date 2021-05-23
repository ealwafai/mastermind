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

      expect(secret_answer.solution(4, 4).length).to eq(4)
      expect(secret_answer.solution(4, 4)).to include('R').or include('B').or include('Y').or include('G')
    end

    it 'it creates array with 6 characters and 5 colors' do
      secret_answer = SecretAnswer.new

      expect(secret_answer.solution(6, 5).length).to eq(6)
      expect(secret_answer.solution(6, 5)).to include('R').or include('B').or include('Y').or include('G').or include('O')
    end

    it 'it creates array with 8 characters and 6 colors' do
      secret_answer = SecretAnswer.new

      expect(secret_answer.solution(8, 6).length).to eq(8)
      expect(secret_answer.solution(8, 6)).to include('R').or include('B').or include('Y').or include('G').or include('O').or include('P')
    end
  end
end
