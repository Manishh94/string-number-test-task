# spec/string_calculator_spec.rb
require  File.expand_path('../../string_calculator', __FILE__)

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end
  end
end
