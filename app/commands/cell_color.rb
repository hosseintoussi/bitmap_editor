require './app/commands/color_base'

module Commands
  class CellColor < ColorBase
    def call(row:, column:, color:)
      execute_validations(row: sanitize(row), column: sanitize(column))
      @bitmap.change_cell_color(row: sanitize(row), column: sanitize(column), color: sanitize(color))
    end

    private

    def execute_validations(row:, column:)
      @validator.validate(x: row, y: column)
    end
  end
end
