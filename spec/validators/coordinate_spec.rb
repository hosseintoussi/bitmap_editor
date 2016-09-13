require 'spec_helper'
require './app/validators/coordinate'

describe Validators::Coordinate do
  describe '.validate' do
    it 'raises if coordinates are not within image size' do
      bitmap = double(Bitmap)
      allow(bitmap).to receive(:rows).and_return(10)
      allow(bitmap).to receive(:columns).and_return(10)

      validator = described_class.new(bitmap: bitmap)

      expect{ validator.validate(x: 11) }.to raise_error(NotValidRow)
      expect{ validator.validate(y: 11) }.to raise_error(NotValidColumn)
    end

    it 'raises nothing if coordinates are within image size' do
      bitmap = double(Bitmap)
      allow(bitmap).to receive(:columns).and_return(10)
      allow(bitmap).to receive(:rows).and_return(10)

      validator = described_class.new(bitmap: bitmap)

      expect(validator.validate(x: 9, y: 9)).to be_nil
    end
  end
end
