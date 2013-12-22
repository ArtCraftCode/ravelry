require_relative 'data'

module Ravelry

  # The information used to create `Ravelry::Pack` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Pack < Data

    attr_reader :quantity_description, :yarn_id, :total_grams, :project_id, :shop_id, :prefer_metric_weight, :prefer_metric_length, :ounces_per_skein, :dye_lot, :skeins, :id, :grams_per_skein, :color_family_id, :shop_name, :total_meters, :stash_id, :total_ounces, :primary_pack_id, :personal_name, :colorway, :meters_per_skein, :yarn_name, :yards_per_skein, :total_yards  
    
    def initialize(pack)
      @quantity_description = pack[:quantity_description]
      @yarn_id = pack[:yarn_id]
      @total_grams = pack[:total_grams]
      @project_id = pack[:project_id]
      @shop_id = pack[:shop_id]
      @prefer_metric_weight = pack[:prefer_metric_weight]
      @prefer_metric_length = pack[:prefer_metric_length]
      @ounces_per_skein = pack[:ounces_per_skein]
      @dye_lot = pack[:dye_lot]
      @skeins = pack[:skeins]
      @id = pack[:id]
      @grams_per_skein = pack[:grams_per_skein]
      @color_family_id = pack[:color_family_id]
      @shop_name = pack[:shop_name]
      @total_meters = pack[:total_meters]
      @stash_id = pack[:stash_id]
      @total_ounces = pack[:total_ounces]
      @primary_pack_id = pack[:primary_pack_id]
      @personal_name = pack[:personal_name]
      @colorway = pack[:colorway]
      @meters_per_skein = pack[:meters_per_skein]
      @yarn_name = pack[:yarn_name]
      @yards_per_skein = pack[:yards_per_skein]
      @total_yards = pack[:total_yards]
    end
  end

end