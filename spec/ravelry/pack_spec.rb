require_relative '../spec_helper'

describe Ravelry::Pack do
  before do
    @pattern = initialize_multipack_pattern
  end

  it 'puts' do
    puts @pattern.packs
  end
end