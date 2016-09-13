require 'spec_helper'
require './app/commands/clear'

describe Commands::Clear do
  describe '.call' do
    it 'sends build_or_clear_table to bitmap' do
      bitmap = double(Bitmap)
      allow_any_instance_of(Validators::Table).to receive(:validate).and_return(nil)
      clear = described_class.new(bitmap: bitmap)

      expect(bitmap).to receive(:build_or_clear_table)

      clear.call
    end
  end
end
