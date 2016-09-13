require './app/commands/color_base'

module Commands
  class HorizontalColor < ColorBase
    def call(row:, from:, to:, color:)
      execute_validations(row: sanitize(row), from: sanitize(from), to: sanitize(to))

      (from..to).each do |column|
        @bitmap.change_cell_color(row: sanitize(row), column: sanitize(column), color: color)
      end
    end

    private

    def execute_validations(row:, from:, to:)
      @validator.validate(x: row)
      @validator.validate(y: from)
      @validator.validate(y: to)
    end
  end
end
