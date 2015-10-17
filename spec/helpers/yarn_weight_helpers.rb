module YarnWeightHelpers

  # Helpers for Ravelry::YarnWeight

  def yw_initialize_empty_yarn
    Ravelry::YarnWeight.new
  end

  def yw_initialize_with_id
    Ravelry::YarnWeight.new(yarn_weight_hash[:id])
  end

  def yw_initialize_with_data_and_id
    yarn = Ravelry::YarnWeight.new(yarn_weight_hash[:id])
    yarn.data = yarn_weight_hash
    yarn
  end

  def yw_initialize_with_data
    yarn = Ravelry::YarnWeight.new
    yarn.data = yarn_weight_hash
    yarn
  end

end