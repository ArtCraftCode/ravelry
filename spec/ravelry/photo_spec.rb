require_relative '../spec_helper'

describe Ravelry::Photo do
  before do
    @photo = Ravelry::Photo.new
    @photo.data = photo
    @data = photo
  end

  it 'creates an instance of Photo' do
    expect(@photo).to be_instance_of(Ravelry::Photo)
  end

  context 'class methods' do
    it 'get'
    it 'post'
    it 'delete'
    it 'get_sizes'

    it '#flickr_url' do
      expect(@photo.flickr_url).to eq(@data[:flickr_url])
    end

    it '#small_url' do
      expect(@photo.small_url).to eq(@data[:small_url])
    end

    it '#medium_url' do
      expect(@photo.medium_url).to eq(@data[:medium_url])
    end

    it '#square_url' do
      expect(@photo.square_url).to eq(@data[:square_url])
    end

    it '#thumbnail_url' do
      expect(@photo.thumbnail_url).to eq(@data[:thumbnail_url])
    end

    it '#shelved_url' do
      expect(@photo.shelved_url).to eq(@data[:shelved_url])
    end

    it '#sort_order' do
      expect(@photo.sort_order).to eq(@data[:sort_order])
    end

    it '#x_offset' do
      expect(@photo.x_offset).to eq(@data[:x_offset])
    end

    it '#y_offset' do
      expect(@photo.y_offset).to eq(@data[:y_offset])
    end
  end
end