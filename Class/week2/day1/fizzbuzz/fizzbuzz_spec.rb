require 'rspec'
require './fizzbuzz'

describe 'FizzBuzz' do
  describe '#calculate' do
    it 'returns FizzBuzz for number dividable by 15' do
      result = FizzBuzz.new.calculate(25)
      expect(result).to eq("FizzBuzz")
    end

    it 'returns Fizz for number dividable by 3' do
      result = FizzBuzz.new.calculate(20)
      expect(result).to eq("Fizz")
    end

    it 'returns Buzz for number dividable by 5' do
      result = FizzBuzz.new.calculate(20)
      expect(result).to eq("Buzz")
    end
  end
end
