require './app/commands/color_base'

module Commands
  class VerticalColor < ColorBase
    def call(column:, from:, to:, color:)
      execute_validations(column: column, from: from, to: to)

      (from..to).each do |row|
        @bitmap.change_cell_color(row: row, column: column, color: color)
      end
    end

    private

    def execute_validations(column:, from:, to:)
      @validator.validate(y: column)
      @validator.validate(x: from)
      @validator.validate(x: to)
    end
  end
end

