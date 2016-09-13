require 'spec_helper'
require './app/commands/create'
require './app/validators/size'
require './app/bitmap'

describe Commands::Create do
  describe '.call' do
    it 'sends build_or_clear_table to bitmap' do
      bitmap = double(Bitmap)
      validator = double(Validators::Size)
      allow(validator).to receive(:validate).and_return(nil)
      allow(bitmap).to receive(:new).and_return(bitmap)

      create = described_class.new(rows: 1, columns: 1, bitmap: bitmap, validator: validator)

      expect(bitmap).to receive(:build_or_clear_table)

      create.call
    end
  end
end

