module PatternsHelpers

  # Helpers for Ravelry::Patterns

  def initialize_empty
    Ravelry::Patterns.new
  end

  def initialize_paid
    # Volatile Magic Shawl
    Ravelry::Patterns.new("379890")
  end

  def initialize_free
    # Wish I Was Weaving This Cowl
    Ravelry::Patterns.new("379890")
  end

  def paid_pattern_stub
    # Volatile Magic Shawl, updated 2013-12-21
    {:pattern_categories=>
      [{
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
      }],
      :notes_html=>"<p>I am a voracious reader. When I think of heroines, I think of my favorite books.",
      :download_location=>
        {
          :type=>"ravelry", :url=>"http://www.ravelry.com/purchase/feministy/185601", :free=>false
        },
      :row_gauge=>40.0,
      :queued_projects_count=>56,
      :price=>6.0,
      :permalink=>"volatile-magic-shawl",
      :name=>"Volatile Magic Shawl",
      :pattern_needle_sizes=>
        [
          {
            :hook=>"E", :us_steel=>"00", :name=>"US 4  - 3.5 mm",
            :crochet=>false, :metric=>3.5, :knitting=>true, :us=>"4 ", :id=>4
          }
        ],
      :yardage_max=>435,
      :gauge_pattern=>"stockinette stitch",
      :printings=>
        [
          {:pattern_source=>
            {
              :price=>nil, :permalink=>"liz-abinantes-ravelry-store",
              :out_of_print=>false, :name=>"Liz Abinante's Ravelry Store",
              :author=>nil, :url=>"http://www.ravelry.com/stores/feministy",
              :amazon_rating=>nil, :patterns_count=>3, :amazon_url=>nil,
              :shelf_image_path=>nil, :list_price=>nil
            },
          :primary_source=>true
          },
          {:pattern_source=>
            {
              :price=>nil, :permalink=>"feministy", :out_of_print=>false,
              :name=>"Feministy.com", :author=>"", :url=>"http://feministy.com/",
              :amazon_rating=>nil, :patterns_count=>47, :amazon_url=>nil,
              :shelf_image_path=>nil, :list_price=>nil
            }, 
          :primary_source=>false
          }
        ],
        :pdf_in_library=>false,
        :downloadable=>true,
        :difficulty_count=>3,
        :notes=>"I am a voracious reader. When I think of heroines, I think of my favorite books.",
        :published=>"2013/07/01",
        :projects_count=>6,
        :gauge=>26.0,
        :difficulty_average=>2.66666666666667,
        :yarn_weight=>
          {
            :name=>"Fingering", :min_gauge=>nil, :wpi=>"14", :id=>5,
            :crochet_gauge=>"", :ply=>"4", :knit_gauge=>"28", :max_gauge=>nil
          },
        :photos=>
          [
            {:flickr_url=>nil, :small_url=>"http://images4.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_small_best_fit.JPG", :x_offset=>-82, :shelved_url=>"http://images4.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_shelved.JPG", :y_offset=>0, :sort_order=>1, :id=>35912328, :square_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_square.JPG", :medium_url=>"http://images4.ravelrycache.com/uploads/feministy/197032385/_D7C0070-Edit-Edit_medium.JPG", :thumbnail_url=>"h"},
            {:flickr_url=>nil, :small_url=>"http://images4-d.ravelrycache.com/uploads/feministy/197032384/_D7C0066-Edit_small_best_fit.JPG", :x_offset=>-43, :shelved_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032384/_D7C0066-Edit_shelved.JPG", :y_offset=>0, :sort_order=>2, :id=>35912326, :square_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032384/_D7C0066-Edit_square.JPG", :medium_url=>"http://images4-d.ravelrycache.com/uploads/feministy/197032384/_D7C0066-Edit_medium.JPG", :thumbnail_url=>"h"},
            {:flickr_url=>nil, :small_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032381/_D7C0059-Edit_small_best_fit.JPG", :x_offset=>-43, :shelved_url=>"http://images4-d.ravelrycache.com/uploads/feministy/197032381/_D7C0059-Edit_shelved.JPG", :y_offset=>0, :sort_order=>3, :id=>35912327, :square_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032381/_D7C0059-Edit_square.JPG", :medium_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032381/_D7C0059-Edit_medium.JPG", :thumbnail_url=>"h"},
            {:flickr_url=>nil, :small_url=>"http://images4.ravelrycache.com/uploads/feministy/197032382/_D7C0053-Edit_small_best_fit.JPG", :x_offset=>-43, :shelved_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032382/_D7C0053-Edit_shelved.JPG", :y_offset=>0, :sort_order=>4, :id=>35912325, :square_url=>"http://images4-b.ravelrycache.com/uploads/feministy/197032382/_D7C0053-Edit_square.JPG", :medium_url=>"http://images4.ravelrycache.com/uploads/feministy/197032382/_D7C0053-Edit_medium.JPG", :thumbnail_url=>"h"}
          ],
        :pattern_type=>
          {
            :permalink=>"shawl", :name=>"Shawl/Wrap", :clothing=>true, :id=>10
          },
        :volumes_in_library=>[],
        :url=>"",
        :gauge_divisor=>4,
        :sizes_available=>"8.5\"/21.5cm at deepest point, 50\"/127cm wingspan",
        :yardage=>425,
        :rating_average=>4.66666666666667,
        :id=>419443,
        :free=>false,
        :gauge_description=>"26 stitches and 40 rows = 4 inches in stockinette stitch",
        :rating_count=>3,
        :pdf_url=>"",
        :pattern_author=>
          {
            :permalink=>"liz-abinante", :name=>"Liz Abinante", :id=>19297,
            :favorites_count=>1314, :patterns_count=>48
          },
        :product_id=>185601,
        :favorites_count=>281,
        :craft=>
          {
            :permalink=>"knitting", :name=>"Knitting", :id=>2
          },
        :yarn_weight_description=>"Fingering / 4 ply (14 wpi)",
        :currency=>"USD",
        :comments_count=>4,
        :ravelry_download=>true,
        :currency_symbol=>"$",
        :packs=>
          [
            {
              :yarn_id=>93171,
              :yarn=>
                {
                  :permalink=>"wooly-wonka-fibers-artio-sock",
                  :yarn_company_id=>969,
                  :yarn_company_name=>"Wooly Wonka Fibers",
                  :name=>"Artio Sock", :id=>93171
                },
              :yarn_name=>"Wooly Wonka Fibers Artio Sock",
              :total_grams=>nil,
              :project_id=>nil,
              :yarn_weight=>
                {
                  :name=>"Fingering",
                  :min_gauge=>nil,
                  :wpi=>"14",
                  :id=>5,
                  :crochet_gauge=>"",
                  :ply=>"4",
                  :knit_gauge=>"28",
                  :max_gauge=>nil
                },
              :shop_id=>nil,
              :prefer_metric_weight=>true,
              :prefer_metric_length=>false, 
              :ounces_per_skein=>nil,
              :dye_lot=>nil,
              :skeins=>nil,
              :id=>31065185,
              :shop_name=>nil,
              :grams_per_skein=>nil,
              :color_family_id=>nil,
              :total_meters=>nil,
              :stash_id=>nil,
              :colorway=>nil,
              :total_ounces=>nil,
              :primary_pack_id=>nil,
              :personal_name=>nil,
              :meters_per_skein=>nil,
              :quantity_description=>nil,
              :yards_per_skein=>nil,
              :total_yards=>nil
            }
          ],
        :yardage_description=>"425 - 435 yards"
      }
  end
end