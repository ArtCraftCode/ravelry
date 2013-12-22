require_relative '../spec_helper'

describe Ravelry::Pack do
  before do
    @pack = Ravelry::Pack.new(nil, single_pack)
  end

  it 'creates an instance of Pack' do
    expect(@pack).to be_instance_of(Ravelry::Pack)
  end

  context 'has and sets reader attributes for' do
    before do
      @data = single_pack
    end

    it 'quantity_description' do
      expect(@pack.quantity_description).to eq(@data[:quantity_description])
    end

    it 'yarn_id' do
      expect(@pack.yarn_id).to eq(@data[:yarn_id])
    end

    it 'total_grams' do
      expect(@pack.total_grams).to eq(@data[:total_grams])
    end

    it 'project_id' do
      expect(@pack.project_id).to eq(@data[:project_id])
    end

    it 'shop_id' do
      expect(@pack.shop_id).to eq(@data[:shop_id])
    end

    it 'prefer_metric_weight' do
      expect(@pack.prefer_metric_weight).to eq(@data[:prefer_metric_weight])
    end

    it 'prefer_metric_length' do
      expect(@pack.prefer_metric_length).to eq(@data[:prefer_metric_length])
    end

    it 'ounces_per_skein' do
      expect(@pack.ounces_per_skein).to eq(@data[:ounces_per_skein])
    end

    it 'dye_lot' do
      expect(@pack.dye_lot).to eq(@data[:dye_lot])
    end

    it 'skeins' do
      expect(@pack.skeins).to eq(@data[:skeins])
    end

    it 'id' do
      expect(@pack.id).to eq(@data[:id])
    end

    it 'grams_per_skein' do
      expect(@pack.grams_per_skein).to eq(@data[:grams_per_skein])
    end

    it 'color_family_id' do
      expect(@pack.color_family_id).to eq(@data[:color_family_id])
    end

    it 'shop_name' do
      expect(@pack.shop_name).to eq(@data[:shop_name])
    end

    it 'total_meters' do
      expect(@pack.total_meters).to eq(@data[:total_meters])
    end

    it 'stash_id' do
      expect(@pack.stash_id).to eq(@data[:stash_id])
    end

    it 'total_ounces' do
      expect(@pack.total_ounces).to eq(@data[:total_ounces])
    end

    it 'primary_pack_id' do
      expect(@pack.primary_pack_id).to eq(@data[:primary_pack_id])
    end

    it 'personal_name' do
      expect(@pack.personal_name).to eq(@data[:personal_name])
    end

    it 'colorway' do
      expect(@pack.colorway).to eq(@data[:colorway])
    end

    it 'meters_per_skein' do
      expect(@pack.meters_per_skein).to eq(@data[:meters_per_skein])
    end

    it 'yarn_name' do
      expect(@pack.yarn_name).to eq(@data[:yarn_name])
    end

    it 'yards_per_skein' do
      expect(@pack.yards_per_skein).to eq(@data[:yards_per_skein])
    end

    it 'total_yards' do
      expect(@pack.total_yards).to eq(@data[:total_yards])
    end
  end
end