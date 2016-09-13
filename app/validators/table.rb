require './app/bitmap_config'
require './app/errors'

module Validators
  class Table
    def initialize(bitmap:)
      @bitmap = bitmap
    end

    def validate
      raise NoImageFound if @bitmap.table.nil?
    end
  end
end
