require './app/errors'

module Validators
  class Coordinate
    def initialize(bitmap:)
      @bitmap = bitmap
    end

    def validate(x: nil, y: nil)
      if x
        raise NotValidRow unless 0 < x && x <= @bitmap.rows
      end
      if y
        raise NotValidColumn unless 0 < y && y <= @bitmap.columns
      end
    end
  end
end
