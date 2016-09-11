require 'matrix'
require './app/bitmap_config'
require './app/validators/size'

class Bitmap
  attr_accessor :table
  attr_reader :columns, :rows
  def initialize(columns: 1, rows: 1, default_value: BitmapConfig::DEFAULT_VALUE, validator: Validators::Size.new)
    @columns = columns
    @rows = rows
    @default_value = default_value
    validator.validate(x: columns, y: rows)
    build_table
  end

  private

  def build_table
    @table = Matrix.build(columns, rows) { @default_value }
  end
end
