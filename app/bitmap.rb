require 'matrix'
require './app/bitmap_config'

class Bitmap
  attr_reader :table, :columns, :rows
  def initialize(columns: 1, rows: 1, default_value: BitmapConfig::DEFAULT_VALUE)
    @columns = columns
    @rows = rows
    @default_value = default_value
  end

  def build_or_clear_table
    @table = Matrix.build(columns, rows) { @default_value }
  end

  def change_cell_color(column:, row:, color:)
    # this is because []= appears to be a private method in Matrix!
    @table.send(:[]=, row, column, color)
  end
end
