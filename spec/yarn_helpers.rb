module YarnHelpers

  # Helpers for Ravelry::Yarn

  def initialize_empty_yarn
    Ravelry::Yarn.new
  end

  def initialize_with_id
    Ravelry::Yarn.new(yarn_hash[:id])
  end

  def initialze_with_data_and_id
    Ravelry::Yarn.new(yarn_hash[:id], yarn_hash)
  end

  def initialize_with_data
    Ravelry::Yarn.new(nil, yarn_hash)
  end

end