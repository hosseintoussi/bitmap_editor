require './app/commands/base'
require './app/validators/coordinate'

module Commands
  class CellColor < Base
    def initialize(bitmap:, validator: Validators::Coordinate)
      super(bitmap: bitmap)
      @validator = validator.new(bitmap: @bitmap)
    end

    def call(row:, column:, color:)
      execute_validations(row: sanitize(row), column: sanitize(column))
      @bitmap.change_cell_color(row: sanitize(row), column: sanitize(column), color: color)
    end

    private

    def execute_validations(row:, column:)
      @validator.validate(x: row, y: column)
    end
  end
end
