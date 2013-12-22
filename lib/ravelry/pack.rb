require_relative 'data'

module Ravelry

  # The information used to create `Ravelry::Pack` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Pack < Data

    # Gets quantity_description 
    def quantity_description
      data[:quantity_description]
    end
    
    # Gets yarn_id
    def yarn_id
      data[:yarn_id]
    end
    
    # Gets total_grams
    def total_grams
      data[:total_grams]
    end
    
    # Gets project_id
    def project_id
      data[:project_id]
    end
    
    # Gets shop_id
    def shop_id
      data[:shop_id]
    end
    
    # Gets prefer_metric_weight
    def prefer_metric_weight
      data[:prefer_metric_weight]
    end
    
    # Gets prefer_metric_length
    def prefer_metric_length
      data[:prefer_metric_length]
    end
    
    # Gets ounces_per_skein
    def ounces_per_skein
      data[:ounces_per_skein]
    end
    
    # Gets dye_lot
    def dye_lot
      data[:dye_lot]
    end
    
    # Gets skeins
    def skeins
      data[:skeins]
    end
    
    # Gets id
    def id
      data[:id]
    end
    
    # Gets grams_per_skein
    def grams_per_skein
      data[:grams_per_skein]
    end
    
    # Gets color_family_id
    def color_family_id
      data[:color_family_id]
    end
    
    # Gets shop_name
    def shop_name
      data[:shop_name]
    end
    
    # Gets total_meters
    def total_meters
      data[:total_meters]
    end
    
    # Gets stash_id
    def stash_id
      data[:stash_id]
    end
    
    # Gets total_ounces
    def total_ounces
      data[:total_ounces]
    end
    
    # Gets primary_pack_id
    def primary_pack_id
      data[:primary_pack_id]
    end
    
    # Gets personal_name
    def personal_name
      data[:personal_name]
    end
    
    # Gets colorway
    def colorway
      data[:colorway]
    end
    
    # Gets meters_per_skein
    def meters_per_skein
      data[:meters_per_skein]
    end
    
    # Gets yarn_name
    def yarn_name
      data[:yarn_name]
    end
    
    # Gets yards_per_skein
    def yards_per_skein
      data[:yards_per_skein]
    end
    
    # Gets total_yards
    def total_yards
      data[:total_yards]
    end

  end

end