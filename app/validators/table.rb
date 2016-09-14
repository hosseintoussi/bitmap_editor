require './app/errors'
require './app/bitmap'

module Validators
  class Table
    def initialize(bitmap:)
      @bitmap = bitmap
    end

    def validate
      raise NoImageFound unless @bitmap.respond_to?(:table)
    end
  end
end
