require 'spec_helper'
require './app/validators/color'

describe Validators::Color do
  describe '.validate' do
    it 'raises if color is not valid' do
      validator = described_class.new

      expect { validator.validate(color: '9') }.to raise_error(NotValidColor)
    end

    it 'raises nothing if Color is Valid' do
      validator = described_class.new

      expect(validator.validate(color: 'D')).to be_nil
    end
  end
end


