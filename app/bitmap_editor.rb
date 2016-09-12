require 'pry'
require './app/bitmap'
require './app/commands/cell_color'
require './app/commands/horizontal_color'
require './app/commands/vertical_color'
require './app/commands/clear'
require './app/commands/display'

class BitmapEditor
  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      chars = input.delete(' ').chars
      command = chars.shift
      case command
        when 'I'
          rows = chars[0].to_i
          columns = chars[1].to_i
          bitmap = Bitmap.new(rows: rows, columns: columns)
        when 'C'
          Commands::Clean.new(bitmap: bitmap).call
        when 'L'
          row = chars[1].to_i - 1
          column = chars[0].to_i - 1
          Commands::CellColor.new(bitmap: bitmap).call(row: row, column: column, color: chars[2])
        when 'V'
          column = chars[0].to_i - 1
          from = chars[1].to_i - 1
          to = chars[2].to_i - 1
          Commands::VerticalColor.new(bitmap: bitmap).call(column: column,from: from, to: to, color: chars[3])
        when 'H'
          row = chars[2].to_i - 1
          from = chars[0].to_i - 1
          to = chars[1].to_i - 1

          Commands::HorizontalColor.new(bitmap: bitmap).call(from:from, to: to, row: row, color: chars[3])
        when 'S'
          Commands::Display.new(bitmap: bitmap).call
        when '?'
          show_help
        when 'X'
          exit_console
        else
          puts 'unrecognised command :('
      end
    end
  end

  private

  def exit_console
    puts 'goodbye!'
    @running = false
  end

  def show_help
    puts "? - Help
      I M N - Create a new M x N image with all pixels coloured white (O).
      C - Clears the table, setting all pixels to white (O).
      L X Y C - Colours the pixel (X,Y) with colour C.
      V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
      H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
      S - Show the contents of the current image
      X - Terminate the session"
  end
end
