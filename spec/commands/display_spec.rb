require 'spec_helper'
require './app/commands/display'

describe Commands::Display do
  describe '.call' do
    it 'prints the matrix' do
      bitmap = double(Bitmap)
      allow(bitmap).to receive(:table).and_return([['T','T','T'],['T','T','T']])

      display = described_class.new(bitmap: bitmap)

      expect(STDOUT).to receive(:puts).with("TTT\nTTT")

      display.call
    end
  end
end
