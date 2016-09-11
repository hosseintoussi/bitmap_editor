require './app/bitmap_config'
require './app/errors'

module Validators
  class Size
    def initialize(min: BitmapConfig::MIN_SIZE, max: BitmapConfig::MAX_SIZE)
      @min = min
      @max = max
    end

    def validate(x: nil, y: nil)
      check(x) if x
      check(y) if y
    end

    private

    def check(value)
      raise OutOfRangeValue unless @min <= value && value <= @max
    end
  end
end
