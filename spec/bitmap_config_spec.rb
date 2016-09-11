require 'spec_helper'
require './app/bitmap_config'

describe BitmapConfig do
  it 'has accessbile default_value' do
    expect(described_class::DEFAULT_VALUE).to eq('O')
  end

  it 'has accessbile min_size' do
    expect(described_class::MIN_SIZE).to eq(1)
  end

  it 'has accessbile mAX_size' do
    expect(described_class::MAX_SIZE).to eq(250)
  end
end
