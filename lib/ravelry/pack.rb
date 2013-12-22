require_relative 'data'

module Ravelry

  # The information used to create `Ravelry::Pack` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Pack < Data

    def quantity_description
      data[:quantity_description]
    end

    def yarn_id
      data[:yarn_id]
    end

    def total_grams
      data[:total_grams]
    end

    def project_id
      data[:project_id]
    end

    def shop_id
      data[:shop_id]
    end

    def prefer_metric_weight
      data[:prefer_metric_weight]
    end

    def prefer_metric_length
      data[:prefer_metric_length]
    end

    def ounces_per_skein
      data[:ounces_per_skein]
    end

    def dye_lot
      data[:dye_lot]
    end

    def skeins
      data[:skeins]
    end

    def id
      data[:id]
    end

    def grams_per_skein
      data[:grams_per_skein]
    end

    def color_family_id
      data[:color_family_id]
    end

    def shop_name
      data[:shop_name]
    end

    def total_meters
      data[:total_meters]
    end

    def stash_id
      data[:stash_id]
    end

    def total_ounces
      data[:total_ounces]
    end

    def primary_pack_id
      data[:primary_pack_id]
    end

    def personal_name
      data[:personal_name]
    end

    def colorway
      data[:colorway]
    end

    def meters_per_skein
      data[:meters_per_skein]
    end

    def yarn_name
      data[:yarn_name]
    end

    def yards_per_skein
      data[:yards_per_skein]
    end

    def total_yards
      data[:total_yards]
    end

  end

end