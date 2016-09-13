require './app/bitmap'

module Commands
  class Base
    def initialize(bitmap: Bitmap.new)
      @bitmap = bitmap
    end

    def call(*args)
      raise 'This method is not implemented yet!'
    end

    private

    def sanitize(input)
      input.to_i - 1
    end
  end
end
