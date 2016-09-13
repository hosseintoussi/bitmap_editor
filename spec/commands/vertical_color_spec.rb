require 'spec_helper'
require './app/commands/vertical_color'

describe Commands::VerticalColor do
  describe '.call' do
    it 'sends change_cell_color to bitmap object with instructions from x to y' do
      validator = double(Validators::Coordinate)
      allow(validator).to receive(:new).and_return(validator)
      allow(validator).to receive(:validate).and_return(nil)
      allow_any_instance_of(Validators::Table).to receive(:validate).and_return(nil)
      bitmap = double(Bitmap)
      vertical_color = described_class.new(bitmap: bitmap, validator: validator)

      expect(bitmap).to receive(:change_cell_color).once

      vertical_color.call(column: 0, from: 0, to: 0, color: 'T' )
    end
  end
end


