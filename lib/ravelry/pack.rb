module Ravelry

  # The information used to create `Ravelry::Pack` currently comes from {Ravelry::Pattern} objects.
  # 
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  # 
  # This class will be updated in future to perform GET, POST, PUT, and DESTROY requests.
  # 
  class Pack < Data

    def build; end

    # Gets quantity_description  from existing `data`.
    def quantity_description
      data[:quantity_description]
    end
    
    # Gets yarn_id from existing `data`.
    def yarn_id
      data[:yarn_id]
    end
    
    # Gets total_grams from existing `data`.
    def total_grams
      data[:total_grams]
    end
    
    # Gets project_id from existing `data`.
    def project_id
      data[:project_id]
    end
    
    # Gets shop_id from existing `data`.
    def shop_id
      data[:shop_id]
    end
    
    # Gets prefer_metric_weight from existing `data`.
    def prefer_metric_weight
      data[:prefer_metric_weight]
    end
    
    # Gets prefer_metric_length from existing `data`.
    def prefer_metric_length
      data[:prefer_metric_length]
    end
    
    # Gets ounces_per_skein from existing `data`.
    def ounces_per_skein
      data[:ounces_per_skein]
    end
    
    # Gets dye_lot from existing `data`.
    def dye_lot
      data[:dye_lot]
    end
    
    # Gets skeins from existing `data`.
    def skeins
      data[:skeins]
    end
    
    # Gets id from existing `data`.
    def id
      data[:id]
    end
    
    # Gets grams_per_skein from existing `data`.
    def grams_per_skein
      data[:grams_per_skein]
    end
    
    # Gets color_family_id from existing `data`.
    def color_family_id
      data[:color_family_id]
    end
    
    # Gets shop_name from existing `data`.
    def shop_name
      data[:shop_name]
    end
    
    # Gets total_meters from existing `data`.
    def total_meters
      data[:total_meters]
    end
    
    # Gets stash_id from existing `data`.
    def stash_id
      data[:stash_id]
    end
    
    # Gets total_ounces from existing `data`.
    def total_ounces
      data[:total_ounces]
    end
    
    # Gets primary_pack_id from existing `data`.
    def primary_pack_id
      data[:primary_pack_id]
    end
    
    # Gets personal_name from existing `data`.
    def personal_name
      data[:personal_name]
    end
    
    # Gets colorway from existing `data`.
    def colorway
      data[:colorway]
    end
    
    # Gets meters_per_skein from existing `data`.
    def meters_per_skein
      data[:meters_per_skein]
    end
    
    # Gets yarn_name from existing `data`.
    def yarn_name
      data[:yarn_name]
    end
    
    # Gets yards_per_skein from existing `data`.
    def yards_per_skein
      data[:yards_per_skein]
    end
    
    # Gets total_yards from existing `data`.
    def total_yards
      data[:total_yards]
    end

  end

end