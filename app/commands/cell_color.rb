require './app/commands/base'
require './app/validators/coordinate'
require './app/validators/color'

module Commands
  class CellColor < Base
    def initialize(bitmap:, validator: Validators::Coordinate, color_validator: Validators::Color.new)
      super(bitmap: bitmap)
      @validator = validator.new(bitmap: @bitmap)
      @color_validator = color_validator
    end

    def call(row:, column:, color:)
      execute_validations(row: sanitize(row), column: sanitize(column), color: color)
      @bitmap.change_cell_color(row: sanitize(row), column: sanitize(column), color: color)
    end

    private

    def execute_validations(row:, column:, color:)
      @color_validator.validate(color: color)
      @validator.validate(x: row, y: column)
    end
  end
end
