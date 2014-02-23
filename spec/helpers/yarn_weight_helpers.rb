module YarnWeightHelpers

  # Helpers for Ravelry::YarnWeight

  def yw_initialize_empty_yarn
    Ravelry::YarnWeight.new
  end

  def yw_initialize_with_id
    Ravelry::YarnWeight.new(yarn_weight_hash[:id])
  end

  def yw_initialize_with_data_and_id
    Ravelry::YarnWeight.new(yarn_weight_hash[:id], yarn_weight_hash)
  end

  def yw_initialize_with_data
    Ravelry::YarnWeight.new(nil, yarn_weight_hash)
  end

end