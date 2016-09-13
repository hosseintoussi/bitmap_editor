require 'spec_helper'
require './app/validators/size'

describe Validators::Size do
  describe '.validate' do
    it 'raises if size is not within the allowed range of config' do
      validator = described_class.new(min: 1, max: 10)

      expect { validator.validate(x: 11) }.to raise_error(OutOfRangeValue)
      expect { validator.validate(y: 11) }.to raise_error(OutOfRangeValue)
    end

    it 'raises nothing if size is within the allowed range of config' do
      validator = described_class.new(min: 1, max: 10)

      expect(validator.validate(x: 9, y: 4)).to be_nil
    end
  end
end
