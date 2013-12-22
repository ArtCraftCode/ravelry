module CategoryHelpers

  # Helpers for Ravelry::CategoryHelpers

  def categories
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
    }]
  end

end