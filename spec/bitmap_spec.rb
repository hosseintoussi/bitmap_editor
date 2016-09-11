require 'spec_helper'
require './app/bitmap'

describe Bitmap do
  describe '.new' do
    it 'sets the table' do
      bitmap = described_class.new(default_value: 'T')

      expect(bitmap.table.row(0).size).to eq(1)
      expect(bitmap.table.column(0).size).to eq(1)
      expect(bitmap.table[0, 0]).to eq('T')
    end
  end
end
