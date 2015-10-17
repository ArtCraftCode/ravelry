module YarnHelpers

  # Helpers for Ravelry::Yarn

  def y_initialize_empty_yarn
    yarn = Ravelry::Yarn.new
  end

  def y_initialize_with_id
    yarn = Ravelry::Yarn.new
    yarn.data = yarn_hash[:id]
    yarn
  end

  def y_initialize_with_data_and_id
    yarn = Ravelry::Yarn.new(yarn_hash[:id])
    yarn.data = yarn_hash
    yarn
  end

  def y_initialize_with_data
    yarn = Ravelry::Yarn.new
    yarn.data = yarn_hash
    yarn
  end

end