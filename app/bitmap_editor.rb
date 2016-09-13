require 'pry'
require './app/commands/cell_color'
require './app/commands/horizontal_color'
require './app/commands/vertical_color'
require './app/commands/clear'
require './app/commands/create'
require './app/commands/display'
require './app/errors'

class BitmapEditor
  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      chars = input.split(' ')
      command = chars.shift
      begin
        case command
        when 'I'
          bitmap = Commands::Create.new(rows: chars[0], columns: chars[1]).call
        when 'C'
          Commands::Clear.new(bitmap: bitmap).call
        when 'L'
          Commands::CellColor.new(bitmap: bitmap).call(column: chars[0], row: chars[1], color: chars[2])
        when 'V'
          Commands::VerticalColor.new(bitmap: bitmap).call(column: chars[0],from: chars[1], to: chars[2], color: chars[3])
        when 'H'
          Commands::HorizontalColor.new(bitmap: bitmap).call(from: chars[0], to: chars[1], row: chars[2], color: chars[3])
        when 'S'
          Commands::Display.new(bitmap: bitmap).call
        when '?'
          show_help
        when 'X'
          exit_console
        else
          puts 'unrecognised command :('
        end
      rescue OutOfRangeValue
        puts 'Values were out of range'
      rescue NotValidRow
        puts 'Row value was invalid'
      rescue NotValidColumn
        puts 'Column value was invalid'
      rescue NoImageFound
        puts 'Image does not exists yet'
      rescue NotValidColor
        puts 'Color should be uppercase letter between A-Z'
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
