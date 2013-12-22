module PatternHelpers

  # Helpers for Ravelry::Pattern

  def initialize_empty_pattern
    Ravelry::Pattern.new
  end

  def initialize_paid
    # Volatile Magic Shawl
    Ravelry::Pattern.new("379890")
  end

  def initialize_free
    # Wish I Was Weaving This Cowl
    Ravelry::Pattern.new("379890")
  end

end