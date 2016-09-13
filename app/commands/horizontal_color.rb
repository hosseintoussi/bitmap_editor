require './app/commands/base'
require './app/validators/coordinate'
require './app/validators/color'

module Commands
  class HorizontalColor < Base
    def initialize(bitmap:, validator: Validators::Coordinate, color_validator: Validators::Color.new)
      super(bitmap: bitmap)
      @validator = validator.new(bitmap: @bitmap)
      @color_validator = color_validator
    end

    def call(row:, from:, to:, color:)
      execute_validations(row: sanitize(row), from: sanitize(from), to: sanitize(to), color: color)

      (from..to).each do |column|
        @bitmap.change_cell_color(row: sanitize(row), column: sanitize(column), color: color)
      end
    end

    private

    def execute_validations(row:, from:, to:, color:)
      @color_validator.validate(color: color)
      @validator.validate(x: row)
      @validator.validate(y: from)
      @validator.validate(y: to)
    end
  end
end
