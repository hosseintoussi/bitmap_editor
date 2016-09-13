require './app/commands/base'
require './app/validators/coordinate'

module Commands
  class VerticalColor < Base
    def initialize(bitmap:, validator: Validators::Coordinate)
      super(bitmap: bitmap)
      @validator = validator.new(bitmap: @bitmap)
    end

    def call(column:, from:, to:, color:)
      execute_validations(column: sanitize(column), from: sanitize(from), to: sanitize(to))

      (from..to).each do |row|
        @bitmap.change_cell_color(row: sanitize(row), column: sanitize(column), color: color)
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

