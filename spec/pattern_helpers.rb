module PatternHelpers

  # Helpers for Ravelry::Pattern

  def p_initialize_empty_pattern
    Ravelry::Pattern.new
  end

  def p_initialize_paid_with_fetch
    # Volatile Magic Shawl
    Ravelry::Pattern.new("379890", nil)
  end

  def p_initialize_free_with_fetch
    # Wish I Was Weaving This Cowl
    Ravelry::Pattern.new("379890", nil)
  end

end