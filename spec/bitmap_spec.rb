require 'spec_helper'
require './app/bitmap'
require './app/validators/size'

describe Bitmap do
  describe '.new' do
    it 'sets rows and columns' do
      bitmap = described_class.new(default_value: 'T')

      expect(bitmap.rows).to eq(1)
      expect(bitmap.columns).to eq(1)
    end
  end

  describe '.build_or_clear_table' do
    it 'sets the table' do
      bitmap = described_class.new(default_value: 'T')

      bitmap.build_or_clear_table

      expect(bitmap.table.row(0).size).to eq(1)
      expect(bitmap.table.column(0).size).to eq(1)
      expect(bitmap.table[0, 0]).to eq('T')
    end
  end

  describe '.change_cell_color' do
    it 'changes the value of cell' do
      bitmap = described_class.new(default_value: 'T')
      bitmap.build_or_clear_table

      bitmap.change_cell_color(column: 0, row: 0, color: 'C')

      expect(bitmap.table[0, 0]).to eq('C')
    end
  end
end
