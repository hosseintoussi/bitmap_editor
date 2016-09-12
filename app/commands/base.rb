require './app/bitmap'

module Commands
  class Base
    def initialize(bitmap:)
      @bitmap = bitmap
    end
  end
end
