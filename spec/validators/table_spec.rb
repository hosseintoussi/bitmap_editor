require 'spec_helper'
require './app/validators/table'

describe Validators::Table do
  describe '.validate' do
    it 'validates if table exists' do
      bitmap = double(Bitmap)
      allow(bitmap).to receive(:table).and_return(nil)

      validator = described_class.new(bitmap: bitmap)

      expect { validator.validate }.to raise_error(NoImageFound)
    end

    it 'raises nothing if table exists' do
      bitmap = double(Bitmap)
      allow(bitmap).to receive(:table).and_return([1,1])

      validator = described_class.new(bitmap: bitmap)

      expect(validator.validate).to be_nil
    end
  end
end

