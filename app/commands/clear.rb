require './app/commands/base'

module Commands
  class Clear < Base
    def call
      @bitmap.build_or_clear_table
    end
  end
end
