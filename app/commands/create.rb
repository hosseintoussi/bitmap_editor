require './app/bitmap'
require './app/validators/size'
require './app/commands/base'

module Commands
  class Create < Base
    def initialize(rows:, columns:, validator: Validators::Size.new, bitmap: Bitmap)
      super(bitmap: bitmap)
      @rows = sanitize(rows)
      @columns = sanitize(columns)
      @validator = validator
    end

    def call
      @validator.validate(x: @columns, y: @rows)
      @bitmap.new(rows: @rows, columns: @columns).tap do |bitmap|
        bitmap.build_or_clear_table
      end
    end

    private

    def sanitize(input)
      input.to_i
    end
  end
end
