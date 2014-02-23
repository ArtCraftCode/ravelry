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

end