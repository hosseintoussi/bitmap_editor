require './app/bitmap_config'
require './app/errors'

module Validators
  class Color
    def validate(color:)
      raise NotValidColor unless color =~ /[A-Z]/
    end
  end
end
