module Helpers
  # Generic test helpers

  def pattern_author
    {
      :permalink=>"liz-abinante", :name=>"Liz Abinante", :id=>19297,
      :favorites_count=>1314, :patterns_count=>48
    }
  end

  def yarn_hash
    {
      :permalink=>"miss-babs-yummy-superwash-sport---3-ply",
      :yarn_company_name=>"Miss Babs",
      :yarn_company_id=>1119,
      :name=>"Yummy Superwash Sport - 3 Ply",
      :id=>18714
    }
  end

  def yarn_weight_hash
    {
      :name=>"Sport",
      :min_gauge=>nil,
      :wpi=>"12",
      :id=>10,
      :crochet_gauge=>nil,
      :ply=>"5",
      :knit_gauge=>"24-26",
      :max_gauge=>nil
    }
  end

  def categories
    {
      :permalink=>"shawl-wrap", :name=>"Shawl / Wrap", :id=>350,
      :parent=>
        {
          :permalink=>"neck-torso", :name=>"Neck / Torso", :id=>338,
          :parent=>
            {
              :permalink=>"accessories", :name=>"Accessories", :id=>337,
              :parent=>
                {
                  :permalink=>"categories", :name=>"Categories", :id=>301
                }
            }
        }
    }
  end

  def craft
    { :permalink=>"knitting", :name=>"Knitting", :id=>2 }
  end

  def needle
    { :hook=>"E", :us_steel=>"00", :name=>"US 4  - 3.5 mm",
      :crochet=>false, :metric=>3.5, :knitting=>true, :us=>"4 ",
      :id=>4 }
  end

  def photo
    { :flickr_url=>nil,
      :small_url=>"http://images4.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_small_best_fit.JPG",
      :x_offset=>-82,
      :shelved_url=>"http://images4.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_shelved.JPG",
      :y_offset=>0,
      :sort_order=>1,
      :id=>35912328,
      :square_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_square.JPG",
      :medium_url=>"http://images4.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_medium.JPG",
      :thumbnail_url=>"h"
    }
  end

  def printing
    [
      {:pattern_source=>
        {
          :price=>nil, :permalink=>"liz-abinantes-ravelry-store",
          :out_of_print=>false, :name=>"Liz Abinante's Ravelry Store",
          :author=>nil, :url=>"http://www.ravelry.com/stores/feministy",
          :amazon_rating=>nil, :pattern_count=>3, :amazon_url=>nil,
          :shelf_image_path=>nil, :list_price=>nil
        },
      :primary_source=>true
      },
      {:pattern_source=>
        {
          :price=>nil, :permalink=>"feministy", :out_of_print=>false,
          :name=>"Feministy.com", :author=>"", :url=>"http://feministy.com/",
          :amazon_rating=>nil, :pattern_count=>47, :amazon_url=>nil,
          :shelf_image_path=>nil, :list_price=>nil
        },
      :primary_source=>false
      }
    ]
  end
end