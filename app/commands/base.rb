require './app/bitmap'
require './app/validators/table'

module Commands
  class Base
    def initialize(bitmap: Bitmap.new, table_validator: Validators::Table)
      @bitmap = bitmap
      @table_validator = table_validator.new(bitmap: @bitmap)
      table_validate_executions
    end

    def call(*args)
      raise 'This method is not implemented yet!'
    end

    private

    def sanitize(input)
      input.to_i - 1
    end

    def table_validate_executions
      @table_validator.validate
    end
  end
end
