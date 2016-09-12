require './app/commands/color_base'

module Commands
  class CellColor < ColorBase
    def call(row:, column:, color:)
      execute_validations(row: row, column: column)
      @bitmap.change_cell_color(row: row, column: column, color: color)
    end

    private

    def execute_validations(row:, column:)
      @validator.validate(x: row, y: column)
    end
  end
end
