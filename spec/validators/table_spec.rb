require 'spec_helper'
require './app/validators/table'

describe Validators::Table do
  describe '.validate' do
    it 'raises if table does not exists' do
      bitmap = nil

      validator = described_class.new(bitmap: bitmap)

      expect { validator.validate }.to raise_error(NoImageFound)
    end

    it 'raises nothing if table exists' do
      bitmap = double(Bitmap)
      allow(bitmap).to receive(:table)

      validator = described_class.new(bitmap: bitmap)

      expect(validator.validate).to be_nil
    end
  end
end

