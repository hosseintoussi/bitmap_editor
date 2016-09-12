require './app/bitmap'
require './app/validators/coordinate'

module Commands
  class ColorBase
    def initialize(bitmap:, validator: Validators::Coordinate)
      @bitmap = bitmap
      @validator = validator.new(bitmap: @bitmap)
    end

    def call(*args)
      raise 'This method is not implemented yet!'
    end
  end
end