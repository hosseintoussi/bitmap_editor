require './app/commands/base'

module Commands
  class Display < Base
    def call
      array = @bitmap.table.to_a
      puts array.map(&:join).join("\n")
    end
  end
end


