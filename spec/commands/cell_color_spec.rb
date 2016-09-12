require 'spec_helper'
require './app/commands/cell_color'
require './app/validators/coordinate'
require './app/bitmap.rb'

describe Commands::CellColor do
  describe '.call' do
    it 'sends change_cell_color to bitmap object with instructions' do
      validator = double(Validators::Coordinate)
      allow(validator).to receive(:new).and_return(validator)
      allow(validator).to receive(:validate).and_return(nil)
      bitmap = double(Bitmap)
      cell_color = described_class.new(bitmap: bitmap, validator: validator)

      expect(bitmap).to receive(:change_cell_color)

      cell_color.call(row: 0, column: 0, color: 'T' )
    end
  end
end
