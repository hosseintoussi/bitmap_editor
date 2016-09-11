require 'matrix'
require './app/bitmap_config'

class Bitmap
  attr_accessor :table
  def initialize(columns: 1, rows: 1, default_value: BitmapConfig::DEFAULT_VALUE)
    @columns = columns
    @rows = rows
    @default_value = default_value
    build_table
  end

  private

  def build_table
    @table = Matrix.build(@columns, @rows) { @default_value }
  end
end
