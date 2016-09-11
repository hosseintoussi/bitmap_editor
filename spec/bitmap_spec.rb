require 'spec_helper'
require './app/bitmap'
require './app/validators/size'

describe Bitmap do
  describe '.new' do
    it 'sets the table' do
      validator = double(Validators::Size)
      allow(validator).to receive(:validate).and_return(nil)

      bitmap = described_class.new(default_value: 'T', validator: validator)

      expect(bitmap.table.row(0).size).to eq(1)
      expect(bitmap.table.column(0).size).to eq(1)
      expect(bitmap.table[0, 0]).to eq('T')
    end
  end
end
